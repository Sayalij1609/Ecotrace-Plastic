package com.ecotrace.plastic.Dao;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.orm.hibernate5.HibernateTemplate;

import com.ecotrace.plastic.Model.User;


public class User_Dao {

	private HibernateTemplate hibernateTemplate;
	
	@Transactional
	public int insert(User user) {
		
		Long i = (Long) this.hibernateTemplate.save(user);
		return i.intValue();  // if you still want to return int

		
	}

	public User getuser(long userID) {
		User user = this.hibernateTemplate.get(User.class, userID);
		return user;

	}

	public List<User> getAllusers() {
		List<User> user = this.hibernateTemplate.loadAll(User.class);
		return user;

	}

	@Transactional
	public void deleteuser(long userId) {
		User user = this.hibernateTemplate.get(User.class, userId);
		this.hibernateTemplate.delete(user);

	}
    
	@Transactional
	public void updateuser(User user) {
		this.hibernateTemplate.update(user);
	}

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
	
}
