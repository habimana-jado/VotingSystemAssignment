<%-- 
    Document   : registerrequest
    Created on : Oct 7, 2019, 8:13:34 PM
    Author     : student
--%>

<%@page import="Dao.DistrictDao"%>
<%@page import="Domain.District"%>
<%@page import="Dao.CitizenDao"%>
<%@page import="Domain.Citizen"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String msg = (String) session.getAttribute("msg");
            out.print(msg);
        %>
        <a href="index.jsp">Back</a>
        <%
            String id = request.getParameter("id");
            String fname = request.getParameter("fname");
            String lname = request.getParameter("lname");
            Date dob = new SimpleDateFormat("dd/MM/yyyy").parse(request.getParameter("dob"));
            String gender = request.getParameter("gender");
            District district = new DistrictDao().findByName(request.getParameter("district"));

            String idyear = id.substring(1, 5);
            System.out.println(idyear);
            if (new Date().getYear() - dob.getYear() < 18) {
                session.setAttribute("msg", "Should have 18 years");
            } else if (fname.trim().length() < 3 || lname.trim().length() < 3) {
                session.setAttribute("msg", "Names Should be at least 3 characters long");
            } else if (idyear.equals(new SimpleDateFormat("yyyy").format(dob))) {
                session.setAttribute("msg", "2nd to 5th character should meet year of birth");
            } else {
                Citizen emp = new Citizen();
                emp.setNationalId(id);
                emp.setFirstName(fname);
                emp.setLastName(lname);
                emp.setSex(gender);
                emp.setDateofBirth(dob);
                emp.setDistrict(district);
                new CitizenDao().register(emp);

                session.setAttribute("msg", "Registered Successfuly");
            }

        %>
    </body>
</html>
