package com.ecotrace.plastic.Dao;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.orm.hibernate5.HibernateTemplate;

import com.ecotrace.plastic.Model.Recycler;



public class Recycler_Dao {

	private HibernateTemplate hibernateTemplate;
	
	
	@Transactional
	public int insert(Recycler recycler) {
		
		Long i = (Long) this.hibernateTemplate.save(recycler);
		return i.intValue();  // if you still want to return int

		
	}

	public Recycler getrecycler(long phone) {
		Recycler recycler = this.hibernateTemplate.get(Recycler.class, phone);
		return recycler;

	}

	public List<Recycler> getAllrecyclers() {
		List<Recycler> recycler = this.hibernateTemplate.loadAll(Recycler.class);
		return recycler;

	}
    
	@Transactional
	public void deleterecycler(long phone) {
        Recycler recycler = this.hibernateTemplate.get(Recycler.class, phone);
        if (recycler != null) {
            this.hibernateTemplate.delete(recycler);
        }
    }
    
	@Transactional
	public void updaterecycler(Recycler recycler) {
		this.hibernateTemplate.update(recycler);
	}
	
	 @Transactional
	    public int updateRecyclerStatus(long phone, String status) {
	        // First get the recycler
	        Recycler recycler = this.hibernateTemplate.get(Recycler.class, phone);
	        
	        if (recycler != null) {
	            // Update the status
	            recycler.setStatus(status);
	            // Save the changes
	            this.hibernateTemplate.update(recycler);
	            return 1; // Return 1 to indicate success
	        }
	        return 0; // Return 0 if recycler not found
	    }



	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
	
}
