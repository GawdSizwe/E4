<%@ Page Title="Home Page" Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Users._Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Users List</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <link rel="stylesheet" href="/../resources/css/bootstrap.min.css" />
    <link rel="stylesheet" href="/../resources/css/dataTables.bootstrap4.min.css" />
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />
    <link rel="stylesheet" href="/../resources/css/custom.css" />
    <link rel="stylesheet" href="/../resources/css/home.css" />
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/select2/3.5.4/select2.min.css" />
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/select2-bootstrap-css/1.4.6/select2-bootstrap.min.css" />
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css" />
    <link type="text/css" href="//gyrocode.github.io/jquery-datatables-checkboxes/1.2.11/css/dataTables.checkboxes.css" rel="stylesheet" />

    <script src="/../resources/js/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="/../resources/js/popper.min.js"></script>
    <script src="/../resources/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/v/bs4/dt-1.10.18/fh-3.1.4/r-2.2.2/rg-1.1.0/sl-1.2.6/datatables.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/select2/3.5.4/select2.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
    <script type='text/javascript' src="/../resources/js/home.js"></script>
    <script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/lodash.js/0.10.0/lodash.min.js"></script>
    <script type="text/javascript" src="//gyrocode.github.io/jquery-datatables-checkboxes/1.2.11/js/dataTables.checkboxes.min.js"></script>

</head>
<body>
    <form id="form1" runat="server">
        <input id="HiddenUsersList" type="hidden" runat="server" value="" />
        <div class="row" style="border-bottom: 5px solid  #94CA4F; margin: 0px; width: 100%; margin-left: 10px;">
            <h2 style="color: #94CA4F; font-size: 1.5rem">Multi-Users List</h2>
        </div>
        <br />
        <div style="margin-left: 10px;">
            <input id="btnAdd" type="button" value="Add User" class="btn btn-primary" />
        </div>
        <div style="height: 83vh; overflow-y: scroll;">
            <table id="UsersTable" class="table table-hover table-bordered table-condensed" style="width: 98%; margin-left: 10px;">
                <thead style="background-color: #8dc73f; color: white; position: sticky; top: 49px; z-index: 100; font-size: 14px; font-weight: 600;">
                    <tr>
                        <th>ID</th>
                        <th>Names</th>
                        <th>Surname</th>
                        <th>Cellphone Number</th>
                    </tr>
                </thead>
            </table>
        </div>
    </form>
</body>
<script>
    $(document).ready(function () {

        CreateTable();
        console.log("Running");

        $('#btnAdd').on('click', function () {
            page = "modals/AddUser.aspx";

            $("#AddUserModal").modal({
                show: true
            });
        });


        $('#UsersTable tbody').on('dblclick', 'td.row-select', function () {
            var rowId = $(this).closest('tr').attr("ID");

            page = "modals/EditUser.aspx?id=" + rowId;

            $("#AddUserModal").modal({
                show: true
            });
        });

        $('#AddUserModal').on('show.bs.modal', function (e) {
            $(".modal-lg").css("width", "600px");
            var modal = $(this);
            modal.find('.modal-body').load(page);
        });

        $('#AddUserModal').on('hide.bs.modal', function (e) {
            table.destroy();
            CreateTable();
            window.location.reload();
            $('.modal-body').html('<div class="progress-bar progress-bar-striped progress-bar-animated bg-success" style="width: 100%">loading...</div>');
            $('.modal-title').text('');
        });
    });
    function CreateTable() {

        table = $("#UsersTable").DataTable({
            dom: '<lf<t>>p',
            oLanguage: {
                sLengthMenu: "Display: _MENU_",
                sInfo: "Displaying _START_ to _END_ of _TOTAL_ loads"
            },
            lengthMenu: [[10, 20, 30, -1], [10, 20, 30, "All"]],
            processing: true,
            fixedHeader: true,
            serverSide: false,
            paging: true,
            info: false,
            rowId: "ID",
            data: JSON.parse($("#HiddenUsersList").val()),
            columns: [
                {
                    className: "row-select",
                    data: "ID"
                },
                {
                    className: "row-select",
                    data: "Names"
                },
                {
                    className: "row-select",
                    data: "Surname"
                },
                {
                    className: "row-select",
                    data: "CellNo"
                }
            ],
            select: {
                style: 'os',
                selector: 'td:first-child'
            },
            bLengthChange: true,
            ordering: false,
            fnRowCallback: function (nRow, aData, iDisplayIndex, iDisplayIndexFull) {
                $(nRow).closest('tr').addClass(aData.colClass);
            }
        });
    }
</script>
</html>

<div class="modal fade" id="AddUserModal" role="dialog">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title"></h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="progress-bar progress-bar-striped progress-bar-animated bg-success" style="width: 100%">loading...</div>
            </div>
        </div>
    </div>
</div>
