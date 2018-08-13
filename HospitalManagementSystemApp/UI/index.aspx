<%@ Page Language="C#" MasterPageFile="main.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="HospitalManagementSystemApp.UI.index" %>

<asp:Content ContentPlaceHolderID="head" runat="server">
    <script src="../Scripts/bootstrap.min.js"></script>
    <script src="../Scripts/jquery-3.1.1.min.js"></script>

    <script  type="text/javascript">
        $(document).ready(function () {
            $('.carousel').carousel({
                interval: 3000
            });
        });
    </script>
</asp:Content>

<asp:Content ContentPlaceHolderID="CarouselSlide" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-8 col-md-offset-2">
                <div id="myCarousel" class="carousel slide" data-ride="carousel">
                    <!-- Indicators -->
                    <ol class="carousel-indicators">
                        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                        <li data-target="#myCarousel" data-slide-to="1"></li>
                        <li data-target="#myCarousel" data-slide-to="2"></li>
                    </ol>

                    <!-- Wrapper for slides -->
                    <div class="carousel-inner">
                        <div class="item active">
                            <img src="../image/1.jpg" class="img-responsive" />

                        </div>

                        <div class="item">
                            <img src="../image/2.jpg" class="img-responsive" />
                        </div>

                        <div class="item">
                            <img src="../image/3.jpg" class="img-responsive" />
                        </div>
                    </div>

                    <!-- Left and right controls -->
                    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
                        <span class="glyphicon glyphicon-chevron-left"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="right carousel-control" href="#myCarousel" data-slide="next">
                        <span class="glyphicon glyphicon-chevron-right"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
            </div>

        </div>
    </div>

</asp:Content>

<asp:Content ContentPlaceHolderID="indexPlaceContentPlaceHolder" runat="server">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Welcome to Hospital Management System</h1>
        </div>
        <div class="col-md-4">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4><i class="fa fa-fw fa-check"></i>Why use our system</h4>
                </div>
                <div class="panel-body">
                    <p>
                        Documented and tested step-by-step method aimed at smooth functioning through standard practices. Used primarily in franchising industry, management systems generally include detailed information on topics such as (1) organizing an enterprise, (2) setting and implementing corporate policies, 
                        (3) establishing accounting, monitoring, and quality control procedures, (4) choosing and training employees, 
                        (5) choosing suppliers and getting best value from them, and (6) 
                       marketing and distribution.
                    </p>
                    <a href="#" class="btn btn-default">Learn More</a>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4><i class="fa fa-fw fa-gift"></i>Manage your hospital</h4>
                </div>
                <div class="panel-body">
                    <p>
                        MediSteer is a web-based state-of-the-art product covering all aspects of operations and management of small, 
                       medium and large-scale hospitals. It helps in improving operational effectiveness and customer care resulting in reduced costs and medical errors.
                    </p>
                    <a href="#" class="btn btn-default">Learn More</a>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4><i class="fa fa-fw fa-compass"></i>Easy to Use</h4>
                </div>
                <div class="panel-body">
                    <p>
                        Easy access to doctors data to generate varied records, including classification based on demographic, gender, age, and so on. It is especially beneficial at ambulatory (out-patient) point, hence enhancing continuity of care. As well as, Internet-based access improves the ability to remotely access such data.
It helps as a decision support system for the hospital authorities for developing comprehensive health care policies.
Efficient and accurate administration of finance, diet of patient, engineering, and distribution of medical aid. 
                    </p>
                    <a href="#" class="btn btn-default">Learn More</a>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-12">
            <h2 class="page-header">Our Portfolio</h2>
        </div>
        <div class="col-md-4 col-sm-6">
            <a href="#">
                <img class="img-responsive img-portfolio img-hover" src="../image/i1.jpg" />
            </a>
        </div>
        <div class="col-md-4 col-sm-6">
            <a href="#">
                <img class="img-responsive img-portfolio img-hover" src="../image/i2.jpg" />
            </a>
        </div>
        <div class="col-md-4 col-sm-6">
            <a href="#">
                <img class="img-responsive img-portfolio img-hover" src="../image/i3.jpg" />

            </a>
        </div>
        <div class="col-md-4 col-sm-6">
            <a href="#">
                <img class="img-responsive img-portfolio img-hover" src="../image/i4.jpg" />

            </a>
        </div>
        <div class="col-md-4 col-sm-6">
            <a href="#">
                    <img class="img-responsive img-portfolio img-hover" src="../image/i5.png" />
            </a>
        </div>
        <div class="col-md-4 col-sm-6">
            <a href="#">
                    <img class="img-responsive img-portfolio img-hover" src="../image/i6.jpg" />
            </a>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-12">
            <h2 class="page-header">Modern Business Features</h2>
        </div>
        <div class="col-md-6">
            <p>Our Business includes:</p>
            <ul>
                <li><strong>Hospital Management System</strong>
                </li>
                <li>Enroll patient</li>
                <li>Search patient</li>
                <li>Enroll Physician</li>
                <li>Search Physician</li>
                <li>View Diagnosis Detail</li>
            </ul>
            <p>The IT system has revolutionised the field of medicine. In this fast-paced world of medicine, it is a daunting task to manage a multi-speciality hospital. A hospital management system (HMS) is a computer or web based system that facilitates managing the functioning of the hospital or any medical set up</p>
        </div>
        <div class="col-md-6">
            <img class="img-responsive" src="../image/HMS.png" />
        </div>
    </div>
    <div class="well">
        <div class="row">
            <div class="col-md-8">
                <p>A Web based HMS can be used for providing online services to patients, appointments and obtaining opinions of consultants sitting away from the hospital set up.</p>
            </div>
            <div class="col-md-4">
                <a class="btn btn-lg btn-default btn-block" href="#">Call to Action</a>
            </div>
        </div>
    </div>
    <footer>
        <div class="row">
            <div class="col-lg-12">
                <p>Copyright &copy; Your Website 2014</p>
            </div>
        </div>
    </footer>
</asp:Content>
