package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.config.CustomUserDetailsService;
import com.example.demo.config.JwtUtil;
import com.example.demo.model.AuthenticationRequest;
import com.example.demo.model.AuthenticationResponse;

@RestController
@CrossOrigin
public class AuthenticationController {
	@Autowired
	private CustomUserDetailsService userDetailsService;

	@Autowired
	private JwtUtil jwtutil;

	@Autowired
	private AuthenticationManager authenticationManager;

	@PostMapping("/authenticate")
	public ResponseEntity<?> createAuthenticationToken(@RequestBody AuthenticationRequest authenticationrequest) {
		try {
			authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(
					authenticationrequest.getUsername(), authenticationrequest.getPassword()));
		} catch (DisabledException e) {
			e.printStackTrace();
		} catch (BadCredentialsException e) {
			e.printStackTrace();
		}
		final UserDetails userdetails = userDetailsService.loadUserByUsername(authenticationrequest.getUsername());
		final String token = jwtutil.generateToken(userdetails);
		return ResponseEntity.ok(new AuthenticationResponse(token));

	}

}
