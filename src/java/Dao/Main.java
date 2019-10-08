package Dao;

import Domain.Citizen;
import Domain.District;

public class Main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
//        District d = new District();
//        d.setId("D001");
//        d.setName("Gasabo");        
//        
//        District d1 = new District();
//        d1.setId("D002");
//        d1.setName("Kicukiro");        
//        
//        District d2 = new District();
//        d2.setId("D003");
//        d2.setName("Nyarugenge");
//        
//        District d3 = new District();
//        d3.setId("D004");
//        d3.setName("Huye");
//        
//        District d4 = new District();
//        d4.setId("D005");
//        d4.setName("Nyanza");
//        
//        new DistrictDao().register(d);
//        new DistrictDao().register(d1);
//        new DistrictDao().register(d2);
//        new DistrictDao().register(d3);
//        new DistrictDao().register(d4);
    
        Citizen cit = new CitizenDao().FindOne(Citizen.class, "343543");
        new CitizenDao().Delete(cit);
    }

}
