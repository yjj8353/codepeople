package com.jhta.cope.util;

import com.github.scribejava.core.builder.api.DefaultApi20;

public class NaverLoginUtils extends DefaultApi20 {

	protected NaverLoginUtils() {
	}

	private static class InstanceHolder {
		private static final NaverLoginUtils INSTANCE = new NaverLoginUtils();
	}

	public static NaverLoginUtils instance() {
		return InstanceHolder.INSTANCE;
	}

	@Override
	public String getAccessTokenEndpoint() {
		return "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code";
	}

	@Override
	protected String getAuthorizationBaseUrl() {
		return "https://nid.naver.com/oauth2.0/authorize";
	}
}
