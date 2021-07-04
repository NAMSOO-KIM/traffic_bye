package traffic.bye.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.extern.slf4j.Slf4j;
import traffic.bye.dao.RedisDAO;
import traffic.bye.exception.IDDuplicateException;
import traffic.bye.exception.KakaoDuplicateException;
import traffic.bye.exception.PhoneDuplicateException;
import traffic.bye.service.CoolSMSService;
import traffic.bye.service.KakaoService;
import traffic.bye.service.MemberService;
import traffic.bye.vo.AuthInfo;
import traffic.bye.vo.AuthType;
import traffic.bye.vo.LoginInfo;
import traffic.bye.vo.MemberVO;
import traffic.bye.vo.ROLE;
import traffic.bye.vo.SMSVO;

@Controller
@Slf4j
@RequestMapping("member")
public class MemberController {
	@Autowired
	KakaoService kakaoService;

	@Autowired
	MemberService memberService;

	@Autowired
	String kakaoLoginRedirectURI;

	@Autowired
	CoolSMSService coolSMSService;

	@Autowired
	RedisDAO redisDAO;

	@GetMapping("/login")
	public String loginForm() {
		return "member/loginForm";
	}

	@PostMapping("/login")
	public String login(LoginInfo loginInfo) {
		log.info("아이디 {} 비밀번호 {}", loginInfo.getLoginId(), loginInfo.getPassword());
		try {
			int res = memberService.login(loginInfo);
			if (res == 0)
				throw new Exception();
			return "redirect:/";
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@GetMapping("/register/auth")
	public String registerAuth() {
		return "member/registerAuth";
	}

	@GetMapping("/register/form")
	public String registerForm(HttpSession session, RedirectAttributes rttr) {
		AuthInfo authInfo = (AuthInfo) session.getAttribute("authInfo");
		if (authInfo == null) {
			rttr.addFlashAttribute("msg", "먼저 인증을 진행해주세요!");
			return "redirect:/member/register/auth";
		}
		return "member/registerForm";
	}

	@GetMapping("/login/kakao")
	public String kakaoLogin() {
		return "redirect:" + kakaoLoginRedirectURI;
	}

	@GetMapping("/login/phone")
	public String phoneLogin() {
		return "member/phoneAuth";
	}

	@GetMapping("/auth/kakao")
	public String authKakao(String code, HttpSession session, RedirectAttributes rttr) {
		try {
			String accessToken = kakaoService.getAccessToken(code);
			System.out.println(accessToken);
			long id = kakaoService.getUserInfo(accessToken);
			memberService.checkKakaoDuplicate(id);
			kakaoService.kakaoLogout(accessToken);
			AuthInfo authInfo = new AuthInfo();
			authInfo.setAuthType(AuthType.KAKAO);
			authInfo.setId(id);
			session.setAttribute("authInfo", authInfo);
			return "redirect:/member/register/form";
		} catch (KakaoDuplicateException ke) {
			rttr.addFlashAttribute("msg", "이미 가입된 아이디입니다!");
			return "redirect:/member/login";
		} catch (Exception e) {
			e.printStackTrace();
			rttr.addFlashAttribute("msg", "가입 중 문제가 발생했습니다!");
			return "member/register/auth";
		}

	}

	@GetMapping("/auth/phone")
	public ResponseEntity<String> authPhone(String phoneNum, HttpSession session) {
		log.info(phoneNum);
		try {
			memberService.checkPhoneDuplicate(phoneNum);
			coolSMSService.send(phoneNum);
			return new ResponseEntity<>(HttpStatus.CREATED);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
	}

	@GetMapping("/auth/phone/check")
	public String authPhoneCheck(SMSVO smsVO, HttpSession session, RedirectAttributes rttr) {
		try {
			log.info(smsVO.toString());
			memberService.checkPhoneDuplicate(smsVO.getPhone());
			coolSMSService.checkSMS(smsVO);
			AuthInfo authInfo = new AuthInfo();
			authInfo.setAuthType(AuthType.PHONE);
			authInfo.setPhone(smsVO.getPhone());
			session.setAttribute("authInfo", authInfo);
			return "redirect:/member/register/form";
		} catch (PhoneDuplicateException pe) {
			pe.printStackTrace();
			rttr.addFlashAttribute("msg", "이미 가입한 번호입니다!");
			return "redirect:/member/login/phone";
		} catch (Exception e) {
			e.printStackTrace();
			rttr.addFlashAttribute("msg", "번호가 일치하지 않습니다!");
			return "redirect:/member/login/phone";
		}
	}

	@GetMapping("/idCheck/{loginId}")
	public ResponseEntity<String> idCheck(@PathVariable String loginId) {
		log.info(loginId);
		try {
			memberService.checkIdDuplicate(loginId);
			return new ResponseEntity<>(HttpStatus.OK);
		} catch (IDDuplicateException ide) {
			ide.printStackTrace();
			return new ResponseEntity<>(HttpStatus.CONFLICT);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
	}

	@PostMapping("")
	public String register(MemberVO memberVO, HttpSession session, RedirectAttributes rttr) {
		log.info(memberVO.toString());
		try {
			AuthInfo authInfo = (AuthInfo) session.getAttribute("authInfo");
			memberVO.setAuthType(authInfo.getAuthType());
			memberVO.setAuthId(authInfo.getId());
			memberVO.setRole(ROLE.USER);
			log.info(memberVO.toString());
			memberService.memberRegister(memberVO);
			session.removeAttribute("authInfo");
		} catch (Exception e) {
			e.printStackTrace();
			rttr.addFlashAttribute("registerInfo", memberVO);
			rttr.addFlashAttribute("msg", "가입에 실패했습니다!");
			return "redirect:/member/register/form";
		}
		return "redirect:/";
	}

}
