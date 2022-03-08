package com.example.demo.config;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.web.filter.OncePerRequestFilter;

import io.jsonwebtoken.ExpiredJwtException;
import springfox.documentation.spring.web.json.Json;

@Component
public class CustomAuthenticationFilter extends OncePerRequestFilter {

	@Autowired
	JwtUtil jwtutil;

	@Override
	protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain)
			throws ServletException, IOException {
		
		try {
			String jwttoken = extractJWTfromRequest(request);
			if (StringUtils.hasText(jwttoken) && jwtutil.validateToken(jwttoken)) {
				UserDetails userDetails = new User(jwtutil.getUsernameFormToken(jwttoken), "",
						jwtutil.getRolesFormToken(jwttoken));
				UsernamePasswordAuthenticationToken usernamePasswordAuthenticationToken = new UsernamePasswordAuthenticationToken(
						userDetails, null, userDetails.getAuthorities());
				SecurityContextHolder.getContext().setAuthentication(usernamePasswordAuthenticationToken);

			}else {
				System.out.println("can not set security context");
			}
		} catch (ExpiredJwtException e) {
			request.setAttribute("exception", e);
		} catch(BadCredentialsException ex) {
			request.setAttribute("exception", ex);
		}
		filterChain.doFilter(request, response);

	}

	private String extractJWTfromRequest(HttpServletRequest request) {
		String bearertoken = request.getHeader("Authorization");
		if (StringUtils.hasText(bearertoken) && bearertoken.startsWith("Bearer ")) {
			return bearertoken.substring(7, bearertoken.length());
		}
		return null;

	}

}
