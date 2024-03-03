<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="viewbooks.aspx.cs" Inherits="ElibraryManagement.viewbooks" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <center>
                    <h3>Book Inventory List</h3>
                </center>
                <div class="row">
                    <div class="col-sm-12 col-md-12">
                        <asp:Panel class="alert alert-success" role="alert" ID="Panel1" runat="server" Visible="False">
                            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                        </asp:Panel>
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="card col-sm-12">
                        <div class="card-body">
                            
                            <div class="row">
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:elibraryDBConnectionString4 %>" ProviderName="<%$ ConnectionStrings:elibraryDBConnectionString4.ProviderName %>" SelectCommand="SELECT * FROM [book_master_tbl]"></asp:SqlDataSource>
                                <div class="col">
                                    <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="book_id" DataSourceID="SqlDataSource1" Font-Bold="True">
                                        <Columns>
                                            <asp:BoundField DataField="book_id" HeaderText="ID" ReadOnly="True" SortExpression="book_id" />
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <div class="card">
                                                        <div class="card-body">
                                                            <div class="row">
                                                                <div class="col-lg-3">
                                                                    <asp:Image ID="Image1" runat="server" CssClass="img-fluid" ImageUrl='<%# Eval("book_img_link") %>' />
                                                                </div>
                                                                <div class="col-lg-9">
                                                                    <h5 class="card-title">
                                                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("book_name") %>' Font-Bold="True" Style="font-size: larger;"></asp:Label>
                                                                    </h5>
                                                                    <p class="card-text">
                                                                        <span class="fw-bold">Author:</span>
                                                                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("author_name") %>' CssClass="text-muted" Font-Bold="True"></asp:Label><br />
                                                                        <span class="fw-bold">Genre:</span>
                                                                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("genre") %>' CssClass="text-muted" Font-Bold="True"></asp:Label><br />
                                                                        <span class="fw-bold">Language:</span>
                                                                        <asp:Label ID="Label4" runat="server" Text='<%# Eval("language") %>' CssClass="text-muted" Font-Bold="True"></asp:Label><br />
                                                                        <span class="fw-bold">Publisher:</span>
                                                                        <asp:Label ID="Label5" runat="server" Text='<%# Eval("publisher_name") %>' CssClass="text-muted" Font-Bold="True"></asp:Label><br />
                                                                        <span class="fw-bold">Publish Date:</span>
                                                                        <asp:Label ID="Label6" runat="server" Text='<%# Eval("publish_date") %>' CssClass="text-muted" Font-Bold="True"></asp:Label><br />
                                                                        <span class="fw-bold">Pages:</span>
                                                                        <asp:Label ID="Label7" runat="server" Text='<%# Eval("no_of_pages") %>' CssClass="text-muted" Font-Bold="True"></asp:Label><br />
                                                                        <span class="fw-bold">Edition:</span>
                                                                        <asp:Label ID="Label8" runat="server" Text='<%# Eval("edition") %>' CssClass="text-muted" Font-Bold="True"></asp:Label><br />
                                                                        <span class="fw-bold">Cost:</span>
                                                                        <asp:Label ID="Label9" runat="server" Text='<%# Eval("book_cost") %>' CssClass="text-muted" Font-Bold="True"></asp:Label><br />
                                                                        <span class="fw-bold">Actual Stock:</span>
                                                                        <asp:Label ID="Label10" runat="server" Text='<%# Eval("actual_stock") %>' CssClass="text-muted" Font-Bold="True"></asp:Label><br />
                                                                        <span class="fw-bold">Available Stock:</span>
                                                                        <asp:Label ID="Label11" runat="server" Text='<%# Eval("current_stock") %>' CssClass="text-muted" Font-Bold="True"></asp:Label><br />
                                                                        <span class="fw-bold">Description:</span>
                                                                        <asp:Label ID="Label12" runat="server" Text='<%# Eval("book_description") %>' CssClass="text-muted" Font-Bold="True"></asp:Label>
                                                                    </p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
