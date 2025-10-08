package com.ecotrace.plastic.Dao;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.orm.hibernate5.HibernateTemplate;

import com.ecotrace.plastic.Model.Collection_Log;
import com.ecotrace.plastic.Model.Recycler;


public class CollectionDao {
   
	private HibernateTemplate hibernateTemplate;
	
	@Transactional
	public int insert(Collection_Log col) {
		
		Integer i = (Integer) this.hibernateTemplate.save(col);
		return i;  // if you still want to return int

		
	}

	public Collection_Log getuser(long colID) {
		Collection_Log col = this.hibernateTemplate.get(Collection_Log.class, colID);
		return col;

	}

	public List<Collection_Log> getAllcol() {
		List<Collection_Log> col = this.hibernateTemplate.loadAll(Collection_Log.class);
		return col;

	}

	@Transactional
	public void deletecol(long colId) {
		Collection_Log col = this.hibernateTemplate.get(Collection_Log.class, colId);
		this.hibernateTemplate.delete(col);

	}
    
	 @Transactional
	    public int updateRequestStatus(int uid, String status) {
	        // First get the recycler
		 Collection_Log col = this.hibernateTemplate.get(Collection_Log.class, uid);
	        
	        if (col != null) {
	            // Update the status
	        	col.setStatus(status);
	            // Save the changes
	            this.hibernateTemplate.update(col);
	            return 1; // Return 1 to indicate success
	        }
	        return 0; // Return 0 if recycler not found
	    }
	
	@Transactional
	public void updateuser(Collection_Log col) {
		this.hibernateTemplate.update(col);
	}

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
}
