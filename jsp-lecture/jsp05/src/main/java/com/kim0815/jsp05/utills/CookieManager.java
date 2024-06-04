package com.kim0815.jsp04.utills;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class CookieManager {
    //CookieManager.createCookie
    public static void createCookie(HttpServletResponse response,
                                    String cookieName,
                                    String cookieValue,
                                    int second) {
        Cookie cookie = new Cookie(cookieName, cookieValue);
        cookie.setMaxAge(second);
        cookie.setPath("/");
        response.addCookie(cookie);

    }

    public static String readCookie(HttpServletRequest request,String cookieName) {
        Cookie cookies[] = request.getCookies();
        String cookieValue = "";
        if (cookies != null) {
            for (int i = 0; i < cookies.length; i++) {
                Cookie cookie = cookies[i];
                if (cookie.getName().equals(cookieName)) {
                    cookieValue = cookie.getValue();
                }
            }
        }
        return cookieValue;
    }

    public static void deleteCookie(HttpServletResponse response,
                                    String cookieName
                                    ) {
        createCookie(response,cookieName,null,0);
    }
    //readCookie, deleteCookie
    //Cookie 읽는 method 만들어 보세요. return String.
    // cookie를 지울때는 같은 이름의 쿠키를 새로만들면서 시간을 0으로 만들면 됨.

}
