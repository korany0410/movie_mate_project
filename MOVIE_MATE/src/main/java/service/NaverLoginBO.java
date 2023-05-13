package service;

import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.github.scribejava.core.model.OAuthRequest;
import com.github.scribejava.core.model.Response;
import com.github.scribejava.core.model.Verb;
import com.github.scribejava.core.oauth.OAuth20Service;

@Component
public class NaverLoginBO {

	// 네이버 로그인 정보
	private final static String NAVER_CLIENT_ID = "1WJZgSQ2gY4nooI1AGEz";
	private final static String NAVER_CLIENT_SECRET = "kWxsIKOgJT";
	private final static String NAVER_REDIRECT_URI = "/mate/movie_mate_naver_signup.do";

	private final static String SESSION_STATE = "naver_oauth_state";
	private final static String PROFILE_API_URL = "https://openapi.naver.com/v1/nid/me";

	public String getAuthorizationUrl(HttpSession session, String serverUrl) {
		String state = generateRandomString();
		setSession(session, state);
		OAuth20Service oauthService = new ServiceBuilder().apiKey(NAVER_CLIENT_ID).apiSecret(NAVER_CLIENT_SECRET)
				.callback(serverUrl + NAVER_REDIRECT_URI).state(state).build(NaverLoginApi.instance());
		return oauthService.getAuthorizationUrl();
	}

	public OAuth2AccessToken getAccessToken(HttpSession session, String code, String state, String serverUrl)
			throws Exception {
		String sessionState = getSession(session);
		System.out.println("sessionstate " + sessionState);
		state = state.replaceAll("state=", "");
		System.out.println("state" + state);
		if (StringUtils.pathEquals(sessionState, state)) {
			System.out.println("c");
			OAuth20Service oauthService = new ServiceBuilder().apiKey(NAVER_CLIENT_ID).apiSecret(NAVER_CLIENT_SECRET)
					.callback(serverUrl + NAVER_REDIRECT_URI).state(state).build(NaverLoginApi.instance());
			OAuth2AccessToken accessToken = oauthService.getAccessToken(code);
			return accessToken;
		}
		return null;
	}

	public String getUserProfile(OAuth2AccessToken oauthToken, String serverUrl) throws Exception {
		OAuth20Service oauthService = new ServiceBuilder().apiKey(NAVER_CLIENT_ID).apiSecret(NAVER_CLIENT_SECRET)
				.callback(serverUrl + NAVER_REDIRECT_URI).build(NaverLoginApi.instance());
		OAuthRequest request = new OAuthRequest(Verb.GET, PROFILE_API_URL, oauthService);
		oauthService.signRequest(oauthToken, request);
		Response response = request.send();
		return response.getBody();
	}

	private String generateRandomString() {
		return UUID.randomUUID().toString();
	}

	private void setSession(HttpSession session, String state) {
		session.setAttribute(SESSION_STATE, state);
	}

	private String getSession(HttpSession session) {
		return (String) session.getAttribute(SESSION_STATE);
	}
}
