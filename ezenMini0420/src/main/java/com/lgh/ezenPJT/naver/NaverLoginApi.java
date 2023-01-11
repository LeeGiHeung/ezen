package com.lgh.ezenPJT.naver;

import com.github.scribejava.core.builder.api.DefaultApi20;

public class NaverLoginApi  extends DefaultApi20 {
	
	protected NaverLoginApi() {
		
	}
	
	private static class InstanceHolder {
		private static final NaverLoginApi INSTANCE = new NaverLoginApi();
	}
	
	public static NaverLoginApi instance() {
		return InstanceHolder.INSTANCE;
	}
	
	//상속한 추상클래스 DefaultApi20의 추상 메서드 구현
	@Override
	public String getAccessTokenEndpoint()  {
		return "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code";
	}
	
	//상속한 추상클래스 DefaultApi20의 추상 메서드 구현
	@Override
	protected String getAuthorizationBaseUrl() {
		return "https://nid.naver.com/oauth2.0/authorize";
	}
}
