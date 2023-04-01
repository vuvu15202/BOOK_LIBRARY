<%@include file="templates/header.jsp" %>
<link rel="stylesheet" href="<%=path%>/css/profile.css">    
<c:set var="a" value="${account}" />
<c:set var="c" value="${customer}" />        
<div class="container bootstrap snippets bootdey">
    <div class="row">
        <div class="profile-nav col-md-3">
            <div class="panel">
                <div class="user-heading round">
                    <a href="#">
                        <img src="${AccCustomerSession.getImage().replace("=s96-c", "")}" alt="">   
                    </a>
                    <h1>${userGoogle.getName()}</h1>
                    <p style="color: black;">${userGoogle.getEmail()}</p>
                </div>

                <ul class="nav nav-pills nav-stacked">
                    <li class="active"><a href="<%=path%>/account/profile"> <i class="fa fa-user"></i> Profile</a></li>
                    <li><a href="<%=path%>/account/profile_myOrder"> <i class="fa fa-calendar"></i> All Order <span class="label label-warning r-activity">9</span></a></li>
                    <li><a href="<%=path%>/account/profile1"> <i class="fa fa-edit"></i> Edit profile</a></li>

                </ul>
            </div>
        </div>
        <div class="profile-info col-md-9">
            <div class="panel">
                <div class="bio-graph-heading">
                    Personal Information
                </div>
                <div class="panel-body bio-graph-info">
                    <div class="row">
                        <div class="bio-row">
                            <p><span>First Name </span>: ${c.getFirstName()}</p>
                        </div>
                        <div class="bio-row">
                            <p><span>Last Name </span>: ${c.getLastName()}</p>
                        </div>
                        <div class="bio-row">
                            <p><span>Address </span>: ${c.getAddress()}</p>
                        </div>
                        <div class="bio-row">
                            <p><span>Contact Title</span>: ${c.getContactTitle()}</p>
                        </div>
                        <div class="bio-row">
                            <p><span>Birthday</span>: ${c.getDateOfBirth()}</p>
                        </div>
                        <div class="bio-row">
                            <p><span>Phone </span>: ${c.getPhoneNumber()}</p>
                        </div>
                        <div class="bio-row">
                            <p><span>Create Date </span>: ${c.getCreateDate()}</p>
                        </div>
                        <div class="bio-row">
                            <p><span>Gender </span>: ${c.isGender()==true?"Male":"Female"}</p>
                        </div>
                        <a href="<%=path%>/account/profile1"><i class="fa fa-edit"></i> Edit Profile</a>          

                    </div>
                </div>
            </div>
            <div>
            </div>
        </div>
    </div>
</div>    
<%@include file="templates/footer.jsp" %>
