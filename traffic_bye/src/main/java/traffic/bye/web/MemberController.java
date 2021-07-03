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
import traffic.bye.exception.IDDuplicateException;
import traffic.bye.exception.KakaoDuplicateException;
import traffic.bye.service.KakaoService;
import traffic.bye.service.MemberService;
import traffic.bye.vo.AuthInfo;
import traffic.bye.vo.AuthType;
import traffic.bye.vo.LoginInfo;
import traffic.bye.vo.MemberVO;
import traffic.bye.vo.ROLE;

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
	
	@GetMapping("/login")
	public String loginForm() {
		return "member/loginForm";
	}
	
	@PostMapping("/login")
	public String login(LoginInfo loginInfo) {
		log.info("아이디 {} 비밀번호 {}", loginInfo.getLoginId(), loginInfo.getPassword());
		try {
			int res = memberService.login(loginInfo);
			if(res == 0) throw new Exception();
			return "redirect:/";
		} catch(Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@GetMapping("/register/auth")
	public String registerAuth() {
		return "member/registerAuth";
	}
	
	@GetMapping("/register/form")
	public String registerForm() {
		log.info("hi");
		return "member/registerForm";
	}
	
	@GetMapping("/login/kakao")
	public String kakaoLogin() {
		return "redirect:" + kakaoLoginRedirectURI;
	}
	
	@GetMapping("/auth/kakao")
	public String authKakao(String code, HttpSession session, RedirectAttributes rttr) {
		try {
			String accessToken = kakaoService.getAccessToken(code);
			System.out.println(accessToken);
			long id = kakaoService.getUserInfo(accessToken);
			memberService.checkKakaoDuplicate(id);
			kakaoService.kakaoLogout(accessToken);
			AuthInfo authInfo = new AuthInfo(AuthType.KAKAO, id);
			session.setAttribute("authInfo", authInfo);
			return "redirect:/member/register/form";
		} catch(KakaoDuplicateException ke) {
			rttr.addFlashAttribute("이미 가입된 아이디입니다!");
			return "redirect:/member/login";
		} catch(Exception e) {
			e.printStackTrace();
			rttr.addFlashAttribute("가입 중 문제가 발생했습니다!");
			return "member/register/auth";
		}
		
	}
	
	@GetMapping("/idCheck/{loginId}")
	public ResponseEntity<String> idCheck(@PathVariable String loginId){
		log.info(loginId);
		try {
			memberService.checkIdDuplicate(loginId);
			return new ResponseEntity<>(HttpStatus.OK);
		} catch(IDDuplicateException ide) {
			ide.printStackTrace();
			return new ResponseEntity<>(HttpStatus.CONFLICT);
		} catch(Exception e) {
			e.printStackTrace();
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
	}
	
	@PostMapping("")
	public String register(MemberVO memberVO, HttpSession session) {
		try {
			AuthInfo authInfo = (AuthInfo)session.getAttribute("authInfo");
			memberVO.setAuthType(authInfo.getAuthType());
			memberVO.setAuthId(authInfo.getId());
			memberVO.setRole(ROLE.USER);
			memberService.memberRegister(memberVO);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return "redirect:/";
	}
}
