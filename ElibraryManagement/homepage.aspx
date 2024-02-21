<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="homepage.aspx.cs" Inherits="ElibraryManagement.homepage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section>
        <img src="imgs/home-bg.jpg" class="img-fluid"/>
    </section>

    <section>
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <center>
                    <h2>Our Features</h2>
                    <p><b>Our 3 Primary Features</b></p>
                    </center>
                </div>
            </div>
            <div class="row">
                 <div class="col-md-4">
                     <center>
                     <img width="150px" src="imgs/digital-inventory.png" />
                        <h4>Digital Book Inventory</h4>
                     <p class="text-justify">The Digital Book Inventory feature integrates e-books seamlessly into library systems, 
                         enhancing patrons' access while streamlining collection management for librarians.</p>
                     </center>
                   </div>

                <div class="col-md-4">
                     <center>
                        <img width="150px" src="imgs/search-online.png" />
                            <h4>Search Books</h4>
                    <p class="text-justify">The search book feature enables users to swiftly find desired titles in the library catalog,
                        providing efficient access to a diverse range of resources customized to their preferences and needs.</p>
                    </center>
                    </div>
                <div class="col-md-4">
                       <center>
                        <img width="150px" src="imgs/defaulters-list.png" />
                              <h4>Defaulter Lists</h4>
                      <p class="text-justify">The Defaulter Lists feature conveniently tracks overdue materials and user accounts, 
                          facilitating effective management of library fines and reminders to ensure accountability in the borrowing system.</p>
                         </center>
                         </div>


            </div>
        </div>
    </section>

    <section>
        <img src="imgs/in-homepage-banner.jpg" class="img-fluid" />
    </section>

    <section>
    <div class="container">
        <div class="row">
            <div class="col-12">
                <center>
                <h2>Our Process</h2>
                <p><b>We have 3 step simple process</b></p>
                </center>
            </div>
        </div>
        <div class="row">
             <div class="col-md-4">
                 <center>
                 <img width="150px" src="imgs/sign-up.png" />
                    <h4>Sign up</h4>
                 <p class="text-justify">The library management system's sign-up process offers patrons 
                     a user-friendly pathway to access its array of services.</p>
                 </center>
               </div>

            <div class="col-md-4">
                 <center>
                    <img width="150px" src="imgs/search-online.png" />
                        <h4>Search Books</h4>
                <p class="text-justify">The search books feature empowers library users to efficiently navigate the library's catalog, 
                    making it effortless to find desired titles and resources.</p>
                </center>
                </div>
            <div class="col-md-4">
                   <center>
                    <img width="150px" src="imgs/library.png" />
                          <h4>Visit Us</h4>
                  <p class="text-justify">Planning a visit to the library is made convenient and inviting through the visit us process. 
                      Patrons can easily access information about library hours, locations, and events.</p>
                     </center>
                     </div>


        </div>
    </div>
</section>

</asp:Content>
