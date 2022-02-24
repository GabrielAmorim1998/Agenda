<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage Principal.Master" AutoEventWireup="true" CodeBehind="Usuarios.aspx.cs" Inherits="Agenda_do_amor.Usuario" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3>Lista de usuários</h3>
    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1Usuarios" DataKeyNames="email" InsertItemPosition="LastItem">
        <AlternatingItemTemplate>
            <tr style="background-color:#FFF8DC;">
                <td>
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Excluir" />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Editar" />
                </td>
                <td>
                    <asp:Label ID="emailLabel" runat="server" Text='<%# Eval("email") %>' />
                </td>
                <td>
                    <asp:Label ID="senhaLabel" runat="server" Text='<%# Eval("senha") %>' />
                </td>
                <td>
                    <asp:Label ID="nomeLabel" runat="server" Text='<%# Eval("nome") %>' />
                </td>
            </tr>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <tr style="background-color:#008A8C;color: #FFFFFF;">
                <td>
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Atualizar" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancelar" />
                </td>
                <td>
                    <asp:Label ID="emailLabel1" runat="server" Text='<%# Eval("email") %>' />
                </td>
                <td>
                    <asp:TextBox ID="senhaTextBox" runat="server" Text='<%# Bind("senha") %>' />
                </td>
                <td>
                    <asp:TextBox ID="nomeTextBox" runat="server" Text='<%# Bind("nome") %>' />
                </td>
            </tr>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                <tr>
                    <td>Nenhum dado foi retornado.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Inserir" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Limpar" />
                </td>
                <td>
                    <asp:TextBox ID="emailTextBox" runat="server" Text='<%# Bind("email") %>' />
                </td>
                <td>
                    <asp:TextBox ID="senhaTextBox" runat="server" Text='<%# Bind("senha") %>' />
                </td>
                <td>
                    <asp:TextBox ID="nomeTextBox" runat="server" Text='<%# Bind("nome") %>' />
                </td>
            </tr>
        </InsertItemTemplate>
        <ItemTemplate>
            <tr style="background-color:#DCDCDC;color: #000000;">
                <td>
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Excluir" />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Editar" />
                </td>
                <td>
                    <asp:Label ID="emailLabel" runat="server" Text='<%# Eval("email") %>' />
                </td>
                <td>
                    <asp:Label ID="senhaLabel" runat="server" Text='<%# Eval("senha") %>' />
                </td>
                <td>
                    <asp:Label ID="nomeLabel" runat="server" Text='<%# Eval("nome") %>' />
                </td>
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                            <tr runat="server" style="background-color:#DCDCDC;color: #000000;">
                                <th runat="server"></th>
                                <th runat="server">email</th>
                                <th runat="server">senha</th>
                                <th runat="server">nome</th>
                            </tr>
                            <tr id="itemPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;">
                        <asp:DataPager ID="DataPager1" runat="server">
                            <Fields>
                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                            </Fields>
                        </asp:DataPager>
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <tr style="background-color:#008A8C;font-weight: bold;color: #FFFFFF;">
                <td>
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Excluir" />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Editar" />
                </td>
                <td>
                    <asp:Label ID="emailLabel" runat="server" Text='<%# Eval("email") %>' />
                </td>
                <td>
                    <asp:Label ID="senhaLabel" runat="server" Text='<%# Eval("senha") %>' />
                </td>
                <td>
                    <asp:Label ID="nomeLabel" runat="server" Text='<%# Eval("nome") %>' />
                </td>
            </tr>
        </SelectedItemTemplate>
</asp:ListView>
<asp:SqlDataSource ID="SqlDataSource1Usuarios" runat="server"
    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [email], [senha], [nome] FROM [usuario]" 
    ConflictDetection="CompareAllValues" 
    DeleteCommand="DELETE FROM [usuario] WHERE [email] = @original_email AND [senha] = @original_senha AND [nome] = @original_nome" 
    InsertCommand="INSERT INTO [usuario] ([email], [senha], [nome]) VALUES (@email, @senha, @nome)" 
    OldValuesParameterFormatString="original_{0}" 
    UpdateCommand="UPDATE [usuario] SET [senha] = @senha, [nome] = @nome WHERE [email] = @original_email AND [senha] = @original_senha AND [nome] = @original_nome" OnInserted="SqlDataSource1Usuarios" OnSelecting="SqlDataSource1Usuarios_Selecting" OnUpdated="SqlDataSource1Usuarios_Updated">
    <DeleteParameters>
        <asp:Parameter Name="original_email" Type="String" />
        <asp:Parameter Name="original_senha" Type="String" />
        <asp:Parameter Name="original_nome" Type="String" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="email" Type="String" />
        <asp:Parameter Name="senha" Type="String" />
        <asp:Parameter Name="nome" Type="String" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="senha" Type="String" />
        <asp:Parameter Name="nome" Type="String" />
        <asp:Parameter Name="original_email" Type="String" />
        <asp:Parameter Name="original_senha" Type="String" />
        <asp:Parameter Name="original_nome" Type="String" />
    </UpdateParameters>
    </asp:SqlDataSource>
<br />
<asp:Label ID="lMsg" runat="server" Font-Size="X-Large" Text="lMsg"></asp:Label>
</asp:Content>
