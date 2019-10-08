<%-- 
    Document   : index
    Created on : Oct 7, 2019, 10:19:59 PM
    Author     : student
--%>

<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Dao.CitizenDao"%>
<%@page import="Domain.Citizen"%>
<%@page import="Dao.DistrictDao"%>
<%@page import="Domain.District"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <form action="registerrequest.jsp" method="POST">
            <table>
                <tbody>

                    <tr>
                        <td><label>National ID:</label></td>
                        <td><input type="text" name="id" value="" /></td>
                    </tr>
                    <tr>
                        <td><label>First Name:</label></td>
                        <td><input type="text" name="fname" value="" /></td>
                    </tr>
                    <tr>
                        <td><label>Last Name:</label></td>
                        <td><input type="text" name="lname" value="" /></td>
                    </tr>
                    <tr>
                        <td><label>Date of Birth:</label></td>
                        <td><input type="text" name="dob" value="" /></td>
                    </tr>
                    <tr>
                        <td><label>Gender:</label></td>
                        <td>
                            <select name="gender">
                                <option>Male</option>
                                <option>Female</option>
                            </select>
                        </td>
                    </tr>

                    <tr>
                        <td><label>District:</label></td>
                        <td>
                            <select name="district">
                                <%
                                    for (District d : new DistrictDao().FindAll(District.class)) {
                                %>

                                <option><%=d.getName()%></option>

                                <%
                                    }
                                %>
                            </select>
                        </td>
                    </tr>

                </tbody>
            </table>
            <input type="submit" value="Register" />
            
        </form>


        <table border = 1>
            <thead>
                <tr>
                    <td>Citizen Names</td>
                    <td>National ID</td>
                    <td>Location</td>
                    <td>DOB</td>
                    <td>Age</td>
                </tr>
            </thead>
            <tbody>
                <%
                    String prefix;
                    for (Citizen c : new CitizenDao().FindAll(Citizen.class)) {
                        if (c.getSex().equals("Male")) {
                            prefix = "Mr.";
                        } else {
                            prefix = "Mrs";
                        }

                %>
                <tr>
                    <td><%= prefix + c.getFirstName() + c.getLastName()%></td>
                    <td><%= c.getNationalId()%></td>
                    <td><%= c.getDistrict().getName()%></td>
                    <td><%= c.getDateofBirth()%></td>
                    <td><%= new Date().getYear() - c.getDateofBirth().getYear() + ""%></td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>

    </body>
</html>
