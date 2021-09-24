<%@page import="com.assignment2.crud.util.SortInterface"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List Trainers</title>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>      
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css">
        <link rel="stylesheet" href="/css/style.css">     
        <script type="text/javascript" src="/js/scripts.js"></script>
    </head>
    <body>
        
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark sticky-top bg-custom">
            <div class="container container-fluid ml-0">
                <a href="../index.jsp"><img id="logo" class="navbar-brand" src="/images/school.png" alt="HomePage" width="80" height="80"></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse justify-content-center" id="navbarSupportedContent">
                    <h2 style="color: #d8ce9d">Trainers List</h2>                                                       
                </div>
            </div>  
            <form:form class="mr-5" action="${pageContext.request.contextPath}/logout"
                    method="POST">
                <input class="bg-transparent rounded-pill text-light" type="submit" value="Logout">           
            </form:form>
        </nav>
                  
        <div class="container-fluid mb-5">
            <div class="row justify-content-between container-fluid">
            <div class="col-4">
                <security:authorize access="hasRole('ADMIN')">
                <button id="add" class="btn btn-lg btn-success text-light btn-dark ml-5 mb-2 mt-4" onclick="window.location.href='showFormForAdd'; return false;">Add Trainer</button>
                </security:authorize>
            </div>
            <div class="col-2">
                <form:form action="search" method="GET" >
                    <div class="input-group rounded">
                        <input type="search" name="searchName" class="form-control rounded" placeholder="Search Trainer" aria-label="Search"
                          aria-describedby="search-addon" autocomplete="off"/>
                        <button style="cursor: pointer;" type="submit" class="input-group-text border-0" id="search-addon">
                            <i class="fas fa-search" ></i>
                        </button>
                    </div>
                </form:form>     
            </div>
        </div> 
        <c:url var="sortLinkFirstName" value="/trainer/list" >
            <c:param name="sort" value="<%= Integer.toString(SortInterface.FIRST_NAME) %>"/>
        </c:url>
        <c:url var="sortLinkLastName" value="/trainer/list" >
            <c:param name="sort" value="<%= Integer.toString(SortInterface.LAST_NAME) %>"/>
        </c:url>
        <c:url var="sortLinkSubject" value="/trainer/list" >
            <c:param name="sort" value="<%= Integer.toString(SortInterface.SUBJECT) %>"/>
        </c:url>
        <table id="mytable" class="table table-bordered table-responsive-md table-responsive-sm text-center table-striped table-hover mt-2">
            <thead>
                <tr>
                    <th>First Name<a href="${sortLinkFirstName}"><i class="fa fa-fw fa-sort"></i></a></th>
                    <th>Last Name<a href="${sortLinkLastName}"><i class="fa fa-fw fa-sort"></i></a></th>
                    <th>Subject<a href="${sortLinkSubject}"><i class="fa fa-fw fa-sort"></i></a></th>
                    <security:authorize access="hasRole('ADMIN')">
                    <th>Actions</th>
                    </security:authorize>
                </tr>
            </thead>
            <tbody id="tablebody">
                <c:forEach var="trainer" items="${trainers}">
                    <c:url var="updateLink" value="/trainer/showFormForUpdate">
                        <c:param name="id" value="${trainer.id}"/>
                    </c:url>
                    <c:url var="deleteLink" value="/trainer/delete">
                        <c:param name="id" value="${trainer.id}"/>
                    </c:url>
                <tr>
                    <td>${trainer.firstName}</td>
                    <td>${trainer.lastName}</td>
                    <td>${trainer.subject}</td>
                <security:authorize access="hasRole('ADMIN')">
                    <td class="d-sm-table-cell">
                        <button class="edit btn btn-success" onclick="window.location.href='${updateLink}'; return false;">Edit</button>
                        <button class="delete btn btn-danger" id=${deleteLink}>Delete</button>
                    </td>
                </security:authorize>    
                </tr>
                <security:authorize access="hasRole('ADMIN')">
                <div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalCenterTitle">Delete Data</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body text-center">
                                You are about to delete a <span class="font-weight-bold">Trainer</span><br/>
                                Are you sure you want to proceed?
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                                <button type="button" id="approveDelete" class="btn btn-primary" onclick="window.location.href=$('#approveDelete').attr('delete-link'); return false;">Delete</button>
                            </div>
                        </div>
                    </div>
                </div>
                </security:authorize>
                </c:forEach>
            </tbody>    
        </table> 
    </div>

    <footer class="mb-2 bg-footer">
        <div class="bottom text-right bg-dark p-2 pr-5">
            <strong class="font-weight-bold">&copy; 2021 | Created by John Grigoriou</strong>
        </div>
    </footer>   
        
    </body>
</html>
