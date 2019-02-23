package com.jhta.cope.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.http.MediaType;
import org.springframework.social.connect.Connection;
import org.springframework.social.google.api.Google;
import org.springframework.social.google.api.impl.GoogleTemplate;
import org.springframework.social.google.api.plus.Person;
import org.springframework.social.google.api.plus.PlusOperations;
import org.springframework.social.google.connect.GoogleConnectionFactory;
import org.springframework.social.oauth2.AccessGrant;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Operations;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.google.gson.Gson;
import com.jhta.cope.service.UserService;
import com.jhta.cope.util.NaverLoginBO;
import com.jhta.cope.util.SessionUtils;
import com.jhta.cope.vo.User;

@Controller
@RequestMapping("/login/*")
public class LoginController {

	@Autowired
	UserService userService;
	@Autowired
	GoogleConnectionFactory googleConnectionFactory;
	@Autowired
	OAuth2Parameters googleOAuth2Parameters;
	@Autowired
	NaverLoginBO naverLoginBo;

	// 구글 로그인&회원가입
	@RequestMapping(value = "googlelogin", method = RequestMethod.GET)
	public String googleLogin(@RequestParam("code") String code, HttpServletRequest request) throws Exception {

		OAuth2Operations oauthOperations = googleConnectionFactory.getOAuthOperations();
		AccessGrant accessGrant = oauthOperations.exchangeForAccess(code, googleOAuth2Parameters.getRedirectUri(),
				null);
		String accessToken = accessGrant.getAccessToken();
		Long expireTime = accessGrant.getExpireTime();
		if (expireTime != null && expireTime < System.currentTimeMillis()) {
			accessToken = accessGrant.getRefreshToken();
		}
		Connection<Google> connection = googleConnectionFactory.createConnection(accessGrant);
		Google google = connection == null ? new GoogleTemplate(accessToken) : connection.getApi();

		PlusOperations plusOperations = google.plusOperations();
		Person profile = plusOperations.getGoogleProfile();
		User user = new User();
		user.setId(profile.getId()).setEmail("g_" + profile.getAccountEmail()).setName(profile.getDisplayName())
				.setPassword(DigestUtils.sha256Hex(profile.getId()));
		userService.insertUser(user, "google");
		user = userService.getUserById(user.getId());
		SessionUtils.addAttribute("LOGIN_USER", user);
		SessionUtils.addAttribute("SEND_LOGIN_MSG", true);
		return "redirect:/home.do";
	}

	// 구글 로그인 맵핑
	@RequestMapping("/googleSignIn")
	public String googleSign() {
		OAuth2Operations auth2Operations = googleConnectionFactory.getOAuthOperations();
		String url = auth2Operations.buildAuthenticateUrl(GrantType.AUTHORIZATION_CODE, googleOAuth2Parameters);
		return "redirect:" + url;
	}

	// 네이버 로그인 맵핑
	@RequestMapping("/naverSignIn")
	public String naverSign(HttpSession session) throws UnsupportedEncodingException {
		String url = naverLoginBo.getAuthorizationUrl(session);
		return "redirect:" + url;
	}

	//네이버 로그인&회원가입
	@RequestMapping("/naverlogin")
	@SuppressWarnings("unchecked")
	public String naverlogin(HttpSession session, String code, String state) throws Exception {
		OAuth2AccessToken oauthToken = naverLoginBo.getAccessToken(session, code, state);
		String result = naverLoginBo.getUserProfile(oauthToken);

		Gson gson = new Gson();
		Map<String, Object> map = gson.fromJson(result, HashMap.class);
		if (map.get("message").equals("success")) {
			Map<String, Object> responseMap = (Map<String, Object>) map.get("response");
			User user = new User();
			user.setId((String) responseMap.get("id"))
					.setPassword(DigestUtils.sha256Hex((String) responseMap.get("id")))
					.setEmail("n_" + (String) responseMap.get("email")).setName((String) responseMap.get("name"));
			userService.insertUser(user, "naver");
			User loginUser = userService.getUserById(user.getId());
			session.setAttribute("LOGIN_USER", loginUser);
			SessionUtils.addAttribute("SEND_LOGIN_MSG", true);
			session.setMaxInactiveInterval(60*24);
		} else {
		}
		return "redirect:/home.do";
	}

	// 기본 로그인
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(@RequestParam("id") String id, @RequestParam("password") String password,
			HttpServletRequest request) {
		User user = userService.getUserById(id);
		if (user == null) {
			return "redirect:/home.do?fail=login";
		}
		if (user.getAuthStatus() == 0) {
			return "redirect:/home.do?fail=auth";
		}
		if (!user.getPassword().equals(DigestUtils.sha256Hex(password))) {
			return "redirect:/home.do?fail=login";
		}
		SessionUtils.addAttribute("LOGIN_USER", user);
		SessionUtils.addAttribute("SEND_LOGIN_MSG", true);
		return "redirect:/home.do";
	}

	@RequestMapping(value = "/logout")
	public String logout() {
		SessionUtils.removeAttribute("LOGIN_USER");
		return "redirect:/home.do";

	}

	// 회원가입 매핑
	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public String registerform(Model model) {
		User user = new User();
		model.addAttribute("userform", user);
		return "user/registerform";
	}

	// 회원가입&유효성 검사
	@RequestMapping(value = "/signup", method = RequestMethod.POST)
	public String registersubmit(@ModelAttribute("userform") @Valid User user, BindingResult errors) throws Exception {
		if (!errors.hasErrors()) {
			try {
				user.setPassword(DigestUtils.sha256Hex(user.getPassword()));
				userService.insertUser(user);
			} catch (DataAccessException e) {
				e.printStackTrace();
				errors.rejectValue("email", null, "동일한 이메일이 존재합니다.");
				return "user/registerform";
			}
		} else {
			return "user/registerform";
		}
		return "user/registercomplete";
	}

	
	@RequestMapping(value = "/joinValueCheck", produces = MediaType.TEXT_PLAIN_VALUE)
	public @ResponseBody String joinValueCheck(String id, String email) {
		String result = "";
		if (id != null) {
			User user = userService.getUserById(id);
			if (user == null) {
				result = "true";
			} else {
				result = "false";
			}
		} else {
			User user = userService.getUserByEmail(email);
			if (user == null) {
				result = "true";
			} else {
				result = "false";
			}
		}
		return result;
	}
	
	//메일
	@RequestMapping(value = "/emailConfirm")
	public String emailConfirm(@RequestParam("userEmail") String userEmail, @RequestParam("key") String key,
			Model model) {
		Map<String, Object> map = new HashMap<>();
		map.put("email", userEmail);
		map.put("key", key);
		User user = userService.userAuth(map);
		model.addAttribute("user", user);
		return "user/confirm";
	}

}
