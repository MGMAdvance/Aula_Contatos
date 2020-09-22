<%@page import="java.util.Map"%>
<%@page import="java.util.Objects"%>
<%@page import="java.util.ArrayList"%>
<%@page import="manager.Contacts"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gerenciar contatoss</title>
    </head>
    <body>
        <%
            Exception err = null;
            Contacts contatos = (Contacts)application.getAttribute("contatos");
            try{
                if(contatos == null){
                    contatos = new Contacts();
                    contatos.addContact("Matheus Gonçalves", "139777777", "matheusgt4@hotmail.com");
                    contatos.addContact(("Victor Luã"), "139888888", "victorluan@bol.com.br");
                    application.setAttribute("contatos", contatos);
                }
                if(request.getParameter("add") != null ){
                    contatos.addContact(request.getParameter("nome"), 
                                    request.getParameter("telefone"), 
                                    request.getParameter("email"));
                    response.sendRedirect(request.getRequestURI());
                }
            }catch(Exception ex){
                err = ex;
            }
        %>
        <form>
            <label>Nome:</label>
            <input type="text" name="nome" required/>
            <label>Telefone:</label>
            <input type="text" name="telefone" required/>
            <label>Email:</label>
            <input type="text" name="email" required/>
            <input type="submit" name="add" value="Adicionar"/>
        </form>
        <br>
        <%if(!Objects.isNull(err)){  %>
            <p>Nenhum contato registrado...</p>
        <%}else{ %>
        <table border="1">
            <tr>
                <th>ID</th>
                <th>Nome</th>
                <th>Telefone</th>
                <th>Email</th>
                <th>Remover</th>
            </tr
            <% for(int i = 0; i < contatos.getContacts().size(); i++){ 
                try{            
            %>
                <tr>
                    <td><%=i%><td>
                    <td><%=contatos.getContacts().get(i).get(0)%></td>
                    <td><%=contatos.getContacts().get(i).get(1)%></td>
                    <td><%=contatos.getContacts().get(i).get(2)%></td>
                </tr>
                <%  }catch(Exception e){
                        continue;
                    }
                  }%>            
        </table>
        <%}%>
    </body>
</html>
