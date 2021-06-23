<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="loginpage.aspx.cs" Inherits="inventory_management_system.loginpage" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>


    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/login.css">

    <style>
        .checkboxlbl{
            font-size: 80%;
            font-weight: 400;
        }

        .error
        {
            font-size:11px;
            color: red;
            padding-bottom:10px;
        }

        .title{
            font-weight:700;
            font-size:30px;
        }
    </style>
</head>
<body>
        <div class="container">
            <div class="row justify-content-center">
            <div class="col-xl-10 col-lg-12 col-md-9">
                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <div class="row">
                            <div class="col-lg-6 d-none d-lg-block text-center bg-login-image">
                                <img src="images/hugo-online-shopping.png" alt="login image" width="130%">
                            </div>
                            <div class="col-lg-6 text-center">
                                <div class="p-5">
                                    <h5 class="title">EazyStocks</h5>

                                    <form class="user" runat="server">
                                        <div class="form-group">
                                            <asp:TextBox ID="exampleInputEmail" CssClass="form-control form-control-user"  placeholder="Enter Email Address..." runat="server"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <asp:TextBox ID="exampleInputPassword" CssClass="form-control form-control-user" placeholder="Password" TextMode="Password" runat="server"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                                <asp:CheckBox ID="CheckBox1" runat="server" />
                                                <label class="checkboxlbl" for="customCheck">Login as Admin</label>
                                        </div>

                                        <div class="error">
                                            <asp:Label ID="ErrorMsg" CssClass="errorMessage" Text="" runat="server" />
                                        </div>

                                        <asp:Button ID="loginBtn" class="btn btn-primary btn-user btn-block" runat="server" Text="Login" OnClick="loginBtn_Click" />
                                        <hr>
                                        <div class="text-center">
                                            <a class="small" style="color: #21D4FD;" href="#">Create an Account!</a>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div> 
                </div>                
            </div>            
        </div>
        </div>
</body>
</html>
