package com.ats.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.NoResultException;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.persistence.TemporalType;

import com.ats.dao.DBUtils.ResultType;
import com.ats.model.Customer;
import com.ats.service.Utils;

public class DBUtils {
	private static final EntityManagerFactory emfactory = Persistence.createEntityManagerFactory( "ATS" );
	
	public enum ResultType {
		SINGLE, LIST;
	}
	public static EntityManagerFactory getEMFactory(){
		return emfactory;
	}

	public static <T> T executeQuery( String queryString, ResultType resultType ){
		return executeQuery( queryString, resultType, null, null, null );
	}
	
	public static <T> T executeQuery( String queryString, ResultType resultType, Class<T> mapToClass ){
		return executeQuery( queryString, resultType, mapToClass, null, null );
	}
	
	public static <T> T executeQuery( String queryString, ResultType resultType, Class<T> mapToClass, Query query ){
		return executeQuery( queryString, resultType, mapToClass, null, query );
	}

	@SuppressWarnings( "unchecked" )
	public static <T> T executeQuery( String queryString, ResultType resultType, Class<T> mapToClass, EntityManager em, Query query ) {
		T t = null;
		if(  em == null )
			em = getEM();
		
		List<T> tList = new ArrayList<>();
		if(Utils.isEmpty(query)){
		  if( queryString != null ){
			query = em.createQuery( queryString );
		  }
		}

		try{
			
			if( resultType.equals( ResultType.SINGLE ) ){
				t = (T) query.getSingleResult();
				em.close();
				
				if(  mapToClass != null  )
					t = BeanMapper.maptoObj( t, mapToClass );
			}
			else{
				t = (T) query.getResultList();
				em.close();
				
				if( mapToClass != null  )
					t = (T) BeanMapper.maptoList( (List<T>) t, tList, mapToClass );
			}
			return (T) t;

		}
		catch( NoResultException e ){
			if( resultType.equals( ResultType.LIST ) )
				return (T) new ArrayList<T>();
		}
		catch( Exception e ){
			e.printStackTrace(  );
			System.out.println( e.getMessage() );
		}
		return t;
	}
	
	

	public static<T> int persist( T obj ){
		try{
		EntityManager entityManager = getEM();
		entityManager.getTransaction().begin();
		entityManager.persist( obj );
		entityManager.getTransaction().commit();
		entityManager.close();
		//entityManager.flush();
		}catch(Exception e){
			e.printStackTrace();
			return 0;
		}
		return 1;
	}
	
	public static<T> int merge( T obj ){
		try{
		EntityManager entityManager = getEM();
		entityManager.getTransaction().begin();
		entityManager.merge( obj );
		entityManager.getTransaction().commit();
		entityManager.close();
		//entityManager.flush();
		}catch(Exception e){
			e.printStackTrace();
			return 0;
		}
		return 1;
	}
	
	public static<T> T persistAndReturn( T obj ){
		try{
		EntityManager entityManager = getEM();
		entityManager.getTransaction().begin();
		entityManager.persist( obj );
		entityManager.getTransaction().commit();
		entityManager.close();
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
		return obj;
	}
	
	public static<T> int update( Class<T> destClass, int id, T obj ){
		try{
		EntityManager entityManager = getEM();
		entityManager.getTransaction().begin();
		T t = (T) entityManager.find(destClass, id );
		
		if( t == null)
			return 0;
		
		BeanMapper.maptoObj( obj, t );
		entityManager.persist( t );
		entityManager.getTransaction().commit();
		entityManager.close();
		}catch(Exception e){
			e.printStackTrace();
			return 0;
		}
		return 1;
	}
	
	public static<T> int delete( Class<T> destClass, int id  ){
		try{
		EntityManager entityManager = getEM();
		entityManager.getTransaction().begin();
		T t = (T) entityManager.find(destClass, id );
		entityManager.remove( t );
		entityManager.getTransaction().commit();
		entityManager.close();
		}catch(Exception e){
			e.printStackTrace();
			return 0;
		}
		return 1;
	}
	

	 public static EntityManager getEM(){
		return emfactory.createEntityManager();
	}

	
}
