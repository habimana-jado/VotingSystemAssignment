
package Dao;

import Domain.District;
import org.hibernate.Query;
import org.hibernate.Session;

public class DistrictDao extends GenericDao<District>{
    
    public District findByName(String name){
        Session s = HibernateUtil.getSessionFactory().openSession();
        Query q = s.createQuery("Select a from District a where a.name=:u");
        q.setParameter("u", name);
        District d = (District) q.uniqueResult();
        s.close();
        return d;
    }
}
