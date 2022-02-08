<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebServiceWithAjaxFramework1.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <script type="text/javascript"  >
         function GetStudentBYID() {

             var id = document.getElementById("txtID").value;
             WebServiceWithAjaxFramework1.WebService1.GetStudentbyID(id, GetStudentByIdSuccessCallback,
                 GetStudentbyIDFailedCallBack);
         }
         

         function GetStudentByIdSuccessCallback(result) {
             document.getElementById("txtName").value = result["Name"];
             document.getElementById("TxtGender").value = result["Gender"];
             document.getElementById("TxtMarks").value = result["TotalMarks"];
         }
         function GetStudentbyIDFailedCallBack(errors) {
             alert(errors.get_message());
         }

     </script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
            <Services>
                <asp:ServiceReference Path="~/WebService1.asmx" />
            </Services>

        </asp:ScriptManager>

       <table style="font-family:Arial ;border:1px solid black">
           <tr>
               <td>
                   <b> ID</b>
               </td>
               <td>
                   <asp:TextBox ID="txtID" runat="server"></asp:TextBox>
               </td>
           </tr>

           <tr>
               <td>
                   <b>
                       Name
                   </b>
               </td>
               <td>
                   <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
               </td>
           </tr>

           <tr>
               <td>
                   <b>
                       Gender
                   </b>
               </td>
               <td>
                   <asp:TextBox ID="TxtGender" runat="server"></asp:TextBox>
               </td>
           </tr>

           <tr>
               <td>
                   <b>
                       TotalMarks
                   </b>
               </td>
               <td>
                   <asp:TextBox ID="TxtMarks" runat="server"></asp:TextBox>
               </td>
           </tr>
           <tr>
               <td colspan="2">
                 
                   <input id="ButtonGet" type="button" value="Get Student" onclick="GetStudentBYID()" />

               </td>
           </tr>
       </table>
        <h1>
           Example of Partial Page PostBack: Above :
        </h1>
         <asp:Label ID="LblMessage" runat="server"></asp:Label>
    </form>   
</body>
</html>
