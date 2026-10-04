<%@ Page Title="Create Quest — IGNITE Admin" Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="CreateQuest.aspx.cs" Inherits="IGNITE.Admin.CreateQuest" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
    <link href="<%= ResolveUrl("~/Content/admin-create-challenge.css") %>" rel="stylesheet" type="text/css" />
</asp:Content>

<asp:Content ID="TopbarContent" ContentPlaceHolderID="TopbarContent" runat="server">
    <div style="display:flex; justify-content:space-between; align-items:center; width:100%;">
        <div style="display:flex; align-items:center; gap:16px;">
            <a href="Quests.aspx" style="display:flex; align-items:center; justify-content:center; width:32px; height:32px; border-radius:50%; border:1px solid #ccc; color:#1a1a1a; text-decoration:none;">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" style="width:16px;height:16px;"><line x1="19" y1="12" x2="5" y2="12"></line><polyline points="12 19 5 12 12 5"></polyline></svg>
            </a>
            <span style="font-size:18px; font-weight:800; color:#1a1a1a;">Create Quest</span>
        </div>
    </div>
</asp:Content>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="create-container">
        
        <div class="form-grid">
            <div class="form-left">
                <div class="form-section">
                    <div class="section-title">Quest Details</div>
                    
                    <div class="form-group">
                        <label>Quest Title *</label>
                        <asp:TextBox ID="txtTitle" runat="server" CssClass="form-input" placeholder="Enter quest title"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <label>Description</label>
                        <asp:TextBox ID="txtDescription" runat="server" CssClass="form-textarea" TextMode="MultiLine" Rows="4" placeholder="Describe the quest..."></asp:TextBox>
                    </div>

                    <div class="form-row">
                        <div class="form-group">
                            <label>Quest Type *</label>
                            <asp:DropDownList ID="ddlQuestType" runat="server" CssClass="form-select">
                                <asp:ListItem Text="Automatic" Value="Automatic"></asp:ListItem>
                                <asp:ListItem Text="Management" Value="Management"></asp:ListItem>
                            </asp:DropDownList>
                        </div>

                        <div class="form-group">
                            <label>Requirement Type *</label>
                            <asp:TextBox ID="txtRequirementType" runat="server" CssClass="form-input" placeholder="e.g., Login, TaskComplete"></asp:TextBox>
                        </div>
                    </div>

                    <div class="form-group">
                        <label>Requirement Value</label>
                        <asp:TextBox ID="txtRequirementValue" runat="server" CssClass="form-input" placeholder="e.g., Before 8:00 AM, 5 tasks"></asp:TextBox>
                    </div>

                    <div class="form-row">
                        <div class="form-group">
                            <label>XP Reward *</label>
                            <asp:TextBox ID="txtXPReward" runat="server" CssClass="form-input" placeholder="e.g., 500"></asp:TextBox>
                        </div>

                        <div class="form-group">
                            <label>Status</label>
                            <asp:DropDownList ID="ddlStatus" runat="server" CssClass="form-select">
                                <asp:ListItem Text="Draft" Value="0"></asp:ListItem>
                                <asp:ListItem Text="Published" Value="1"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                </div>

                <div class="form-section">
                    <div class="section-title">Timeline (Optional)</div>
                    
                    <div class="form-row">
                        <div class="form-group">
                            <label>Start Date</label>
                            <asp:TextBox ID="txtStartDate" runat="server" CssClass="form-input" TextMode="Date"></asp:TextBox>
                        </div>

                        <div class="form-group">
                            <label>End Date</label>
                            <asp:TextBox ID="txtEndDate" runat="server" CssClass="form-input" TextMode="Date"></asp:TextBox>
                        </div>
                    </div>
                </div>
            </div>

            <div class="form-right">
                <div class="preview-card">
                    <div class="preview-header">Preview</div>
                    <div class="preview-content">
                        <div class="preview-title"><asp:Literal ID="litPreviewTitle" runat="server" Text="Quest Title"></asp:Literal></div>
                        <div class="preview-type"><asp:Literal ID="litPreviewType" runat="server" Text="Automatic"></asp:Literal></div>
                        <div class="preview-xp"><asp:Literal ID="litPreviewXP" runat="server" Text="0 XP"></asp:Literal></div>
                        <div class="preview-req"><asp:Literal ID="litPreviewReq" runat="server" Text="Requirement"></asp:Literal></div>
                    </div>
                </div>

                <div class="action-buttons">
                    <asp:Button ID="btnPublish" runat="server" CssClass="btn-primary" Text="Publish Quest" OnClick="btnPublish_Click" />
                    <asp:Button ID="btnDraft" runat="server" CssClass="btn-secondary" Text="Save as Draft" OnClick="btnDraft_Click" />
                    <asp:Button ID="btnCancel" runat="server" CssClass="btn-tertiary" Text="Cancel" OnClick="btnCancel_Click" />
                </div>
            </div>
        </div>

    </div>
</asp:Content>
