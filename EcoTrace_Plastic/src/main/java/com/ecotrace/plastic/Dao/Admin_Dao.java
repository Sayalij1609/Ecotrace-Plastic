package com.ecotrace.plastic.Dao;

import org.springframework.orm.hibernate5.HibernateTemplate;

public class Admin_Dao {
	
	private HibernateTemplate hibernateTemplate;

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

}
