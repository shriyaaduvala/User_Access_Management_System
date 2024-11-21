<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <title>Login Page</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Bootstrap v5.1.3 CDNs -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://kit.fontawesome.com/0e941f0e5d.js" crossorigin="anonymous"></script>
    
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


</head>
<style>

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    height: 100vh;
    display: flex;
    align-items: center;
    justify-content: center;
    /* background: #0d6efd; */
    background-image: linear-gradient( 173.1deg,  rgba(226,66,249,0.94) 10.2%, rgba(79,147,249,1) 77.3% );
}

.login {
    width: 360px;
    height: min-content;
    padding: 20px;
    border-radius: 12px;
    
    background-image: radial-gradient( circle 369px at -2.9% 12.9%,  rgba(247,234,163,1) 0%, rgba(236,180,238,0.56) 46.4%, rgba(163,203,247,1) 100.7% );
    
}

.login h1 {
    font-size: 36px;
    margin-bottom: 25px;
}

.login form {
    font-size: 20px;
}

.login form .form-group {
    margin-bottom: 12px;
}
.login form .form-control{
    border: 2px solid black;
}
.login form input[type="submit"] {
    font-size: 20px;
    margin-top: 15px;
}
.form-check-input
{
    border: 1px solid black;
}
.btn
{
    background-image: radial-gradient( circle farthest-corner at 10% 20%,  rgba(255,37,174,1) 0%, rgba(241,147,55,1) 53.4%, rgba(250,237,56,1) 99.5% );
    border: 1px solid black;

}

#email
{
    padding: 4px;
    font-size: 20px;
}

#password
{
    padding: 4px;
    font-size: 20px;
}

</style>
<body>

    <div class="login">

        <h2 class="text-center">User Management System </h2>
        
        <form action="login" method="get">
            <div class="form-group ">
                <label class="form-label" >Email Address</label>
                <input class="form-control" type="email" name="email" id="email" autocomplete="off" required>
                
            </div>
            <div class="form-group">
                <label class="form-label" for="password">Password</label>
                <input class="form-control" type="password" name = "password" id="password" required>
                
            </div>
            <div class="form-group form-check">
                <input class="form-check-input" type="checkbox" id="check">
                <label class="form-check-label" for="check">Remember me</label>
            </div>
            <input class="btn btn-success w-100" type="submit" value="Login"  onclick="showMsg()">
            
        </form>

    </div>
    
    
    

</body>

</html>