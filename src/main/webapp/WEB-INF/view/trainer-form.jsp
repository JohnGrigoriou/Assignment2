<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Trainer Form</title>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>      
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css">
        <link rel="stylesheet" href="/css/style.css">  
        <script type="text/javascript" src="/js/scripts.js"></script>
        <style>
            small {
                color: red;
                font-weight: bold;
            }
        </style> 
        <script>
            $(document).ready(function(){
                $(".form-control").focusout(function(){
                   let input =  $(this).val().trim();
                   let regex =  new RegExp('^([A-Za-z\\s]*)$');
                   if (input.length < 1 || input.length > 30) {
                       $(this).next().html('<i class="fas fa-exclamation-circle text-danger"></i> Must be between 1 and 30 characters');
                       $('#submit').prop('disabled', true);
                   } else if (!regex.test(input)) {
                       $(this).next().html('<i class="fas fa-exclamation-circle text-danger"></i> Only Latin characters allowed!');    
                       $('#submit').prop('disabled', true);
                   } else {
                       $(this).next().html('<i class="fa fa-check-circle text-success" aria-hidden="true"></i>');
                       $('#submit').prop('disabled', false);
                   }
                });
            });
        </script>
    </head>
    <body>
        
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark sticky-top bg-custom">
            <div class="container container-fluid ml-0">
                <a href="../index.jsp"><img id="logo" class="navbar-brand" src="/images/school.png" alt="HomePage" width="80" height="80"></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse justify-content-center" id="navbarSupportedContent">
                    <h2 style="color: #d8ce9d">Trainer's Form</h2>
                </div>
            </div>
            <form:form class="mr-5" action="${pageContext.request.contextPath}/logout"
                    method="POST">
                <input class="bg-transparent rounded-pill text-light" type="submit" value="Logout">           
            </form:form>
        </nav>
        
            
        <div id="myform">
            <div class="container" id="formBox">
                <div class="container">
                    <header>
                        <h1 class="display-4 text-black-50 text-center mt-5 ">Form</h1>
                    </header>
                </div>
                <div class="container">
                    <form:form action="save" modelAttribute="trainer" method="POST">
                        <form:hidden path="id"/>
                        <fieldset class="form-group">
                            <legend>Trainer Details</legend>
                            <div>
                                <label class="col-form-label" for="fname">First Name(*):</label>
                                <form:input class="form-control bg-light" path="firstName" autocomplete="off" placeholder="1-30 Latin characters"/>
                                <small></small>
                                <small><form:errors path="firstName"/></small>
                            </div>    
                            <div>
                                <label class="col-form-label" for="lname">Last Name(*):</label>
                                <form:input class="form-control bg-light" path="lastName" autocomplete="off" placeholder="1-30 Latin characters"/>
                                <small></small>
                                <small><form:errors path="lastName"/></small>
                            </div>
                        </fieldset>
                        <fieldset class="form-group">
                            <legend>Subject</legend>
                            <div>
                                <label class="col-form-label" for="sub">Subject(*):</label>
                                <form:input class="form-control bg-light" path="subject" autocomplete="off" placeholder="1-30 Latin characters"/>
                                <small></small>
                                <small><form:errors path="subject"/></small>
                            </div>
                        </fieldset>
                            <div class="row justify-content-start justify-content-md-center">
                                <input id="submit" class="col-12 col-md-3 col-lg-2 btn btn-lg btn-primary m-2 col-1" type="submit" value="Save" />
                                <input id="cancel" class="col-12 col-md-3 col-lg-2 btn btn-lg btn-danger m-2 col-1" value="Cancel" 
                                       onclick="window.location.href='list'; return false;">
                            </div>
                    </form:form>
                </div>    
            </div>
        </div>
        
        <footer class="mb-2 bg-footer">
            <div class="bottom text-right bg-dark p-2 pr-5">
                <strong class="font-weight-bold">&copy; 2021 | Created by John Grigoriou</strong>
            </div>
        </footer>  
        
    </body>
</html>
