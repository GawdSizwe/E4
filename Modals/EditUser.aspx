<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditUser.aspx.cs" Inherits="Users.Modals.EditUser" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="formEditUser" runat="server">
        <div class="form-group row">
            <div class="col-sm-6">
                <input id="hiddenUserID" type="hidden" runat="server" />
                <div>
                    <div class="form-group row">
                        <label class="col-sm-4 col-form-label col-form-label-sm">Name</label>
                        <div class="col-sm-10">
                            <asp:TextBox ID="txtName" runat="server" CssClass="form-control form-control-sm" />
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-4 col-form-label col-form-label-sm">Surname</label>
                        <div class="col-sm-10">
                            <asp:TextBox ID="txtSurname" runat="server" CssClass="form-control form-control-sm" />
                        </div>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-12 col-form-label col-form-label-sm">Cellphone Number</label>
                    <div class="col-sm-10">
                        <asp:TextBox ID="txtCellNo" runat="server" CssClass="form-control form-control-sm" />
                    </div>
                </div>
            </div>
        </div>
        <div class="container" style="margin-top: 20px">
            <div class="form-group row">
                <div class="col-sm-12" style="text-align: right">
                    <input type="button" id="btnEditUser" runat="server" value="Edit" class="btn btn-primary" />
                    <input type="button" id="btnDeleteUser" runat="server" value="Delete" class="btn btn-primary" />
                </div>
            </div>
        </div>
    </form>
</body>
<script>
    $(function () {
        $(".modal-title").text("Edit User");

        $("#btnEditUser").on('click', function () {
            var ID = $("#hiddenUserID").val();
            var Name = $("#txtName").val();
            var Surname = $("#txtSurname").val();
            var CellNo = $("#txtCellNo").val();

            var jsonData = { "ID": ID, "Names": Name, "Surname": Surname, "CellNo": CellNo };

            $.ajax({
                type: "POST",
                url: "modals/EditUser.aspx/UpdateUser",
                data: JSON.stringify({ data: jsonData }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (r) {
                    $('.modal').modal('toggle');
                },
                error: function (error) {
                    alert(error.responseText);
                }
            });
        });

        $("#btnDeleteUser").on('click', function () {
            var ID = $("#hiddenUserID").val();
            var Name = $("#txtName").val();
            var Surname = $("#txtSurname").val();
            var CellNo = $("#txtCellNo").val();

            var jsonData = { "ID": ID, "Names": Name, "Surname": Surname, "CellNo": CellNo };

            $.ajax({
                type: "POST",
                url: "modals/EditUser.aspx/DeleteUser",
                data: JSON.stringify({ data: jsonData }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (r) {
                    $('.modal').modal('toggle');
                },
                error: function (error) {
                    alert(error.responseText);
                }
            });
        });
    });
</script>
</html>
