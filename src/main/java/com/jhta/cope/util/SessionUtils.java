package com.jhta.cope.util;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;

/**
 * HttpSession과 관련된 작업이 구현된 유틸클래스다.
 *
 */
public class SessionUtils {
    
	/**
	 * 세션객체에 지정된 속성명으로 저장된 객체를 조회한다.
	 * @param name 속성명
	 * @return 객체
	 */
	public static Object getAttribute(String name) {
        return (Object)RequestContextHolder.getRequestAttributes().getAttribute(name, RequestAttributes.SCOPE_SESSION);
    }

	/**
	 * 세션객체에 지정된 속성명으로 값을 저장한다.
	 * @param name 속성명
	 * @param value 객체
	 */
    public static void addAttribute(String name, Object value) {
        RequestContextHolder.getRequestAttributes().setAttribute(name, value, RequestAttributes.SCOPE_SESSION);
    }

    /**
     * 세션객체에서 지정된 속성명으로 저장된 값을 삭제한다.
     * @param name 속성명
     */
    public static void removeAttribute(String name) {
        RequestContextHolder.getRequestAttributes().removeAttribute(name, RequestAttributes.SCOPE_SESSION);
    }

    /**
     * 세션아이디를 반환한다.
     * @return 세션아이디
     */
    public static String getSessionId() {
        return RequestContextHolder.getRequestAttributes().getSessionId();
    }
}
