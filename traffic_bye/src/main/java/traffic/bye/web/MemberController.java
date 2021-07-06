package traffic.bye.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.extern.slf4j.Slf4j;
import traffic.bye.dao.RedisDAO;
import traffic.bye.exception.IDDuplicateException;
import traffic.bye.exception.KakaoDuplicateException;
import traffic.bye.exception.PhoneDuplicateException;
import traffic.bye.exception.SMSMissMatchException;
import traffic.bye.service.CoolSMSService;
import traffic.bye.service.KakaoService;
import traffic.bye.service.MemberService;
import traffic.bye.vo.AuthInfo;
import traffic.bye.vo.AuthType;
import traffic.bye.vo.MemberVO;
import traffic.bye.vo.ROLE;
import traffic.bye.vo.SMSVO;
import traffic.bye.vo.UserDetailsVO;

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
	String kakaoFindIdRedirectURI;
	
	@Autowired
	String kakaoFindPwRedirectURI;
	
	@Autowired
	String kakaoAuthInfo;
	
	@Autowired
	String kakaoAuthFindId;
	
	@Autowired
	String kakaoAuthFindPw;

	@Autowired
	CoolSMSService coolSMSService;

	@Autowired
	RedisDAO redisDAO;

	@RequestMapping(value = "/login", method = { RequestMethod.POST, RequestMethod.GET })
	public String loginForm(HttpServletRequest req) {
		// 요청 시점의 사용자 URI 정보를 Session의 Attribute에 담아서 전달(잘 지워줘야 함)
		// 로그인이 틀려서 다시 하면 요청 시점의 URI가 로그인 페이지가 되므로 조건문 설정
		String uri = req.getHeader("Referer");
		if (uri != null && req.getMethod().equals("GET") && !uri.contains("/member/login")) {
			req.getSession().setAttribute("prevPage", uri);
		}
		return "member/loginForm";
	}

	@PostMapping("/loginProcess")
	public void loginProcess() {
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
			String accessToken = kakaoService.getAccessToken(code, kakaoAuthInfo);
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
		} catch(PhoneDuplicateException pde) {
			pde.printStackTrace();
			return new ResponseEntity<>(HttpStatus.CONFLICT);
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
	
	@GetMapping("/findId")
	public String findId() {
		return "member/findId";
	}
	
	@GetMapping("/findPw")
	public String findPw() {
		return "member/findPw";
	}
	
	@GetMapping("/findId/kakao")
	public String findIdKakao() {
		return "redirect:" + kakaoFindIdRedirectURI;
	}
	@GetMapping("/auth/findId/kakao")
	public String authFindIdKakao(String code, RedirectAttributes rttr) {
		try {
			String accessToken = kakaoService.getAccessToken(code, kakaoAuthFindId);
			System.out.println(accessToken);
			Long id = kakaoService.getUserInfo(accessToken);
			String loginId = memberService.findIdByKakaoId(id);
			if(loginId == null) throw new Exception();
			kakaoService.kakaoLogout(accessToken);
			rttr.addFlashAttribute("msg", String.format("가입하신 아이디는 %s입니다.", loginId));
		}  catch (Exception e) {
			e.printStackTrace();
			rttr.addFlashAttribute("msg", "존재하지 않는 아이디입니다!");
		}
		return "redirect:/member/result";
	}
	
	@GetMapping("/findId/phone")
	public String findIdPhone() {
		return "member/findIdByPhone";
	}
	
	@GetMapping("/auth/findId/phone")
	public ResponseEntity<String> authFindIdPhone(String phoneNum) {
		log.info(phoneNum);
		try {
			String loginId = memberService.findIdByPhone(phoneNum);
			if(loginId == null) throw new Exception();
			coolSMSService.send(phoneNum);
			return new ResponseEntity<>(HttpStatus.OK);
		} catch(Exception e) {
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
	}
	
	@GetMapping("/auth/findId/phone/check")
	public String authFindIdPhoneCheck(SMSVO smsVO, RedirectAttributes rttr) {
		try {
			log.info(smsVO.toString());
			coolSMSService.checkSMS(smsVO);
			String loginId = memberService.findIdByPhone(smsVO.getPhone());
			if(loginId == null) throw new Exception();
			rttr.addFlashAttribute("msg", String.format("가입하신 아이디는 %s입니다.", loginId));
		} catch (SMSMissMatchException sme) {
			sme.printStackTrace();
			rttr.addFlashAttribute("msg", "번호가 일치하지 않습니다!");
		} catch (Exception e) {
			rttr.addFlashAttribute("msg", "가입된 번호가 없습니다!");
		}
		return "redirect:/member/result";
	}
	
	@GetMapping("/mypage")
	public String mypage(Authentication authentication) {
		UserDetailsVO vo = (UserDetailsVO)authentication.getPrincipal();
		log.info("id : {}, loginId : {}, password : {}", new Object[] {vo.getId(), vo.getUsername(), vo.getPassword()});
		return "member/mypage";
	}
	
	@GetMapping("/result")
	public String result() {
		return "member/result";
	}

}
