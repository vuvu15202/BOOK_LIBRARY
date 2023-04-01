<%@include file="templates/header.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--************************************
                Main Start
*************************************-->
<main id="tg-main" class="tg-main tg-haslayout">
    <!--************************************
                    About Us Start
    *************************************-->
    <section class="tg-sectionspace tg-haslayout">
        <div class="container">
            <div class="row">
                <div class="tg-aboutus">
                    <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                        <div class="tg-aboutusshortcode">
                            <div class="tg-sectionhead">
                                <h2><span>Greetings &amp; Welcome</span>About Book Library</h2>
                            </div>
                            <div class="tg-description">
                                <p>Every month, we send our subscribers a box with the five best books of the month. These are bestsellers and classic books that deserve to be read and placed on your bookshelf. We select books according to the preferences of our customers. In addition, you can always attend our events, join the book club or just visit our online web.</p>
                            </div>
                            <div class="tg-btns">
                                <a class="tg-btn tg-active" href="<%=path%>/account/login">Sign In</a>
                                <a class="tg-btn" href="#more">Learn more</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                            <img src="<%=path%>/images/aboutus.jpg" alt="image description"/>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--************************************
                    About Us End
    *************************************-->
    <!--************************************
                    Success Start
    *************************************-->
    <section class="tg-sectionspace tg-haslayout">
        <div class="container">
            <div class="row">
                <div class="tg-successstory" id="more">
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                        <div class="tg-sectionhead">
                            <h2>Why Book Library is a Good Idea</h2>
                        </div>
                        <div id="tg-successslider" class="tg-successslider tg-success owl-carousel">
                            <div class="item">
                                <figure>
                                    <img src="<%=path%>/images/aboutus (2).jpg" alt="image description">
                                </figure>
                                <div class="tg-successcontent">
                                    <div class="tg-sectionhead">
                                        <h2><span>Reading books boosts your creativity and verbal abilities.</span>Inspiration</h2>
                                    </div>
                                    <div class="tg-description">
                                        <p>We have a extensive selection, ranging from children's books and beautifully illustrated preschool books to teen chapter books and adult titles. We LOVE books for all ages! And, what we love more than books, is connecting people with books that will make us laugh, cry, think, learn… or even all of that together. We're here to help you choose a great book for anyone based on the reader's interest and reading level.</p>
                                    </div>
                                </div>
                            </div>
                            <div class="item">
                                <figure>
                                    <img src="<%=path%>/images/aboutus (3).jpg" alt="image description">
                                </figure>
                                <div class="tg-successcontent">
                                    <div class="tg-sectionhead">
                                        <h2><span>Don't waste time in bookshops and on reading blah books.</span>Picked for You</h2>
                                    </div>
                                    <div class="tg-description">
                                        <p>Whether you're looking for the latest bestseller or a more obscure gem, we can help you find it. We offer novels, comics, graphic novels and a wide selection of non-fiction, or even research books.Don't worry!</p>
                                    </div>
                                </div>
                            </div>
                            <div class="item">
                                <figure>
                                    <img src="<%=path%>/images/aboutus(4).jpg" alt="image description">
                                </figure>
                                <div class="tg-successcontent">
                                    <div class="tg-sectionhead">
                                        <h2><span>Our Mission</span>Reading creates an impact</h2>
                                    </div>
                                    <div class="tg-description">
                                        <p>To inspire individuals by bringing together quality and affordability in a unique experience like no other bookstore in the world. Reading is not just a pleasant pastime. Books help to concentrate and accelerate thinking processes. They open whole worlds for us, where we can imagine anything. Join our service and read more every day!</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--************************************
                    Success End
    *************************************-->
   
    <!--************************************
                    Authors Start
    *************************************-->
    <section class="tg-sectionspace tg-haslayout">
        <div class="container">
            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                    <div class="tg-sectionhead">
                        <h2><span>Team Behind Book Library</span>Meet Our Professionals</h2>
                    </div>
                </div>
                <div id="tg-teamsslider" class="tg-authors tg-authorsslider tg-teamsmember owl-carousel">
                    <div class="item tg-author tg-member">
                        <figure><a href="javascript:void(0);"><img src="<%=path%>/images/team/vuvu.jpg" alt="image description"></a></figure>
                        <div class="tg-authorcontent">
                            <h2><a href="javascript:void(0);">Vu Vu</a></h2>
                            <span>Online Retail Manager</span>
                            <ul class="tg-socialicons">
                                <li class="tg-facebook"><a href="javascript:void(0);"><i class="fa fa-facebook"></i></a></li>
                                <li class="tg-twitter"><a href="javascript:void(0);"><i class="fa fa-twitter"></i></a></li>
                                <li class="tg-linkedin"><a href="javascript:void(0);"><i class="fa fa-linkedin"></i></a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="item tg-author tg-member">
                        <figure><a href="javascript:void(0);"><img src="<%=path%>/images/team/huy.jpg" alt="image description"></a></figure>
                        <div class="tg-authorcontent">
                            <h2><a href="javascript:void(0);">Huy Nguyen</a></h2>
                            <span>Bookstore Director</span>
                            <ul class="tg-socialicons">
                                <li class="tg-facebook"><a href="javascript:void(0);"><i class="fa fa-facebook"></i></a></li>
                                <li class="tg-twitter"><a href="javascript:void(0);"><i class="fa fa-twitter"></i></a></li>
                                <li class="tg-linkedin"><a href="javascript:void(0);"><i class="fa fa-linkedin"></i></a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="item tg-author tg-member">
                        <figure><a href="javascript:void(0);"><img src="<%=path%>/images/team/thanh.jpg" alt="image description"></a></figure>
                        <div class="tg-authorcontent">
                            <h2><a href="javascript:void(0);">Thanh Dao</a></h2>
                            <span>Business Operations</span>
                            <ul class="tg-socialicons">
                                <li class="tg-facebook"><a href="javascript:void(0);"><i class="fa fa-facebook"></i></a></li>
                                <li class="tg-twitter"><a href="javascript:void(0);"><i class="fa fa-twitter"></i></a></li>
                                <li class="tg-linkedin"><a href="javascript:void(0);"><i class="fa fa-linkedin"></i></a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="item tg-author tg-member">
                        <figure><a href="javascript:void(0);"><img src="<%=path%>/images/team/quyen.jpg" alt="image description"></a></figure>
                        <div class="tg-authorcontent">
                            <h2><a href="javascript:void(0);">Quyen Kim</a></h2>
                            <span>Assistant Director</span>
                            <ul class="tg-socialicons">
                                <li class="tg-facebook"><a href="javascript:void(0);"><i class="fa fa-facebook"></i></a></li>
                                <li class="tg-twitter"><a href="javascript:void(0);"><i class="fa fa-twitter"></i></a></li>
                                <li class="tg-linkedin"><a href="javascript:void(0);"><i class="fa fa-linkedin"></i></a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="item tg-author tg-member">
                        <figure><a href="javascript:void(0);"><img src="<%=path%>/images/team/trang.jpg" alt="image description"></a></figure>
                        <div class="tg-authorcontent">
                            <h2><a href="javascript:void(0);">Trang Vu</a></h2>
                            <span>Business Operations</span>
                            <ul class="tg-socialicons">
                                <li class="tg-facebook"><a href="javascript:void(0);"><i class="fa fa-facebook"></i></a></li>
                                <li class="tg-twitter"><a href="javascript:void(0);"><i class="fa fa-twitter"></i></a></li>
                                <li class="tg-linkedin"><a href="javascript:void(0);"><i class="fa fa-linkedin"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--************************************
                    Authors End
    *************************************-->
</main>
<!--************************************
                Main End
*************************************-->
<%@include file="templates/footer.jsp" %>