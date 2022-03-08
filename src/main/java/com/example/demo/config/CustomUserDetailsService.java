package com.example.demo.config;

import java.util.Arrays;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.example.demo.repository.UserInterface;

@Service
public class CustomUserDetailsService implements UserDetailsService {

	@Autowired
	UserInterface userinterface;
	
	
	@Bean 
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}
	
	@Transactional
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
	com.example.demo.model.User user = userinterface.findByUserName(username);
		List<SimpleGrantedAuthority> roles=null;
		System.out.println(user.getPassword());
		
		if( user.getUserType()==null) {
			roles = Arrays.asList(new SimpleGrantedAuthority("USER"));
			return new User(user.getUserName(),passwordEncoder().encode(user.getPassword()),
					roles);
		}
		if(user.getUserType().equals("Vendor"))
		{
			System.out.println("entered vendor");
		roles = Arrays.asList(new SimpleGrantedAuthority("ADMIN"));
		return new User(user.getUserName(),passwordEncoder().encode(user.getPassword()),
					roles);
		}
		else if(user.getUserType().equals("Customer"))
		{
			System.out.println("entered customer");
		roles = Arrays.asList(new SimpleGrantedAuthority("ROLE_USER"));
		return new User(user.getUserName(), user.getPassword(),
				roles);
		}
		throw new UsernameNotFoundException("User not found with username: " + username);
	
	}

}
