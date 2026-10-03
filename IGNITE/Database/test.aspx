<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="test.aspx.cs" Inherits="IGNITE.Database.test" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Database CRUD Operations</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f5f5f5;
        }
        .container {
            max-width: 1400px;
            margin: 0 auto;
            background-color: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        h1 {
            color: #333;
            border-bottom: 3px solid #007bff;
            padding-bottom: 10px;
            margin-bottom: 30px;
        }
        .table-selector {
            margin-bottom: 20px;
            padding: 15px;
            background-color: #f8f9fa;
            border-radius: 6px;
            border: 1px solid #ddd;
        }
        .table-selector label {
            font-weight: 600;
            margin-right: 10px;
        }
        .table-selector select {
            padding: 8px 12px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 14px;
            min-width: 200px;
        }
        .action-buttons {
            margin-bottom: 20px;
        }
        .btn {
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 14px;
            margin-right: 10px;
        }
        .btn-primary {
            background-color: #007bff;
            color: white;
        }
        .btn-primary:hover {
            background-color: #0056b3;
        }
        .btn-success {
            background-color: #28a745;
            color: white;
        }
        .btn-success:hover {
            background-color: #218838;
        }
        .btn-danger {
            background-color: #dc3545;
            color: white;
        }
        .btn-danger:hover {
            background-color: #c82333;
        }
        .btn-warning {
            background-color: #ffc107;
            color: #000;
        }
        .btn-warning:hover {
            background-color: #e0a800;
        }
        .table-container {
            margin-bottom: 40px;
            border: 1px solid #ddd;
            border-radius: 6px;
            overflow: hidden;
        }
        .table-header {
            background-color: #007bff;
            color: white;
            padding: 15px 20px;
            font-size: 18px;
            font-weight: bold;
        }
        .table-info {
            background-color: #f8f9fa;
            padding: 10px 20px;
            color: #666;
            font-size: 14px;
            border-bottom: 1px solid #ddd;
        }
        .grid-view {
            width: 100%;
            border-collapse: collapse;
        }
        .grid-view th {
            background-color: #007bff;
            color: white;
            padding: 12px;
            text-align: left;
            font-weight: 600;
            border-bottom: 2px solid #0056b3;
        }
        .grid-view td {
            padding: 10px 12px;
            border-bottom: 1px solid #ddd;
            word-wrap: break-word;
            max-width: 300px;
        }
        .grid-view tr:nth-child(even) {
            background-color: #f8f9fa;
        }
        .grid-view tr:hover {
            background-color: #e9ecef;
        }
        .no-data {
            padding: 20px;
            text-align: center;
            color: #999;
            font-style: italic;
        }
        .error-message {
            background-color: #f8d7da;
            color: #721c24;
            padding: 15px;
            border-radius: 6px;
            margin-bottom: 20px;
            border: 1px solid #f5c6cb;
        }
        .success-message {
            background-color: #d4edda;
            color: #155724;
            padding: 15px;
            border-radius: 6px;
            margin-bottom: 20px;
            border: 1px solid #c3e6cb;
        }
        .form-panel {
            background-color: #f8f9fa;
            padding: 20px;
            border-radius: 6px;
            margin-bottom: 20px;
            border: 1px solid #ddd;
        }
        .form-panel h3 {
            margin-top: 0;
            color: #333;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            font-weight: 600;
            margin-bottom: 5px;
        }
        .form-group input, .form-group textarea, .form-group select {
            width: 100%;
            padding: 8px 12px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 14px;
            box-sizing: border-box;
        }
        .form-control {
            width: 100%;
            padding: 8px 12px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 14px;
            box-sizing: border-box;
        }
        .form-control.readonly {
            background-color: #e9ecef;
            cursor: not-allowed;
        }
        .form-group textarea {
            min-height: 100px;
            resize: vertical;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h1>Database CRUD Operations</h1>

            <div class="table-selector">
                <label for="ddlTables">Select Table:</label>
                <asp:DropDownList ID="ddlTables" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlTables_SelectedIndexChanged"></asp:DropDownList>
            </div>

            <div class="action-buttons">
                <asp:Button ID="btnLoadTable" runat="server" Text="Load Table Data" CssClass="btn btn-primary" OnClick="btnLoadTable_Click" />
                <asp:Button ID="btnShowInsert" runat="server" Text="Add New Record" CssClass="btn btn-success" OnClick="btnShowInsert_Click" />
            </div>

            <asp:Label ID="lblError" runat="server" Visible="false" CssClass="error-message"></asp:Label>
            <asp:Label ID="lblSuccess" runat="server" Visible="false" CssClass="success-message"></asp:Label>

            <!-- Insert/Edit Form Panel -->
            <asp:Panel ID="pnlForm" runat="server" Visible="false" CssClass="form-panel">
                <h3 id="formTitle" runat="server">Add New Record</h3>
                <asp:PlaceHolder ID="phFormFields" runat="server"></asp:PlaceHolder>
                <div class="action-buttons">
                    <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-success" OnClick="btnSave_Click" />
                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn btn-danger" OnClick="btnCancel_Click" />
                </div>
            </asp:Panel>

            <!-- Data Grid -->
            <asp:Panel ID="pnlData" runat="server" Visible="false">
                <div class="table-container">
                    <div class="table-header">
                        <asp:Label ID="lblTableName" runat="server"></asp:Label>
                    </div>
                    <div class="table-info">
                        <asp:Label ID="lblRecordCount" runat="server"></asp:Label>
                    </div>
                    <asp:GridView ID="gvData" runat="server" CssClass="grid-view" AutoGenerateColumns="true"
                        GridLines="None" AllowPaging="false" OnRowCommand="gvData_RowCommand">
                        <Columns>
                            <asp:ButtonField ButtonType="Button" CommandName="EditRecord" Text="Edit" HeaderText="Actions" ControlStyle-CssClass="btn btn-warning" />
                            <asp:ButtonField ButtonType="Button" CommandName="DeleteRecord" Text="Delete" HeaderText="Actions" ControlStyle-CssClass="btn btn-danger" />
                        </Columns>
                    </asp:GridView>
                </div>
            </asp:Panel>
        </div>
    </form>
</body>
</html>
