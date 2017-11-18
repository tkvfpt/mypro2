package com.pro2.dao;

import java.util.List;

import org.hibernate.Query;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.pro2.dao.entity.User;
import com.pro2.dao.generic.GenericDAO;

@Transactional
@Component("userDAO")
public class UserDAO extends GenericDAO<User> implements UserDetailsService{

	@Override
	public List<User> getAll() {
		setClassType(User.class);
		return super.getAll();
	}

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		Query query = getSession().createQuery("FROM User u WHERE u.username = :username");
        query.setParameter("username", username);
        User user = (User) query.uniqueResult();
        if (user == null) {
            throw new UsernameNotFoundException("User with username '" + username + "' does not exist.");
        }
        return user;
	}
		
}
