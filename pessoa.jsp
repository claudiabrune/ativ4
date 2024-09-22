<%@page import="dao.UsuarioDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entidade.Pessoa"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de Pessoas</title>
        <link rel="stylesheet" type="text/css" href="estilo.css">
    </head>

    <%
        Pessoa p = (Pessoa) request.getAttribute("pessoa");
        if (p == null) {
            p = new Pessoa();
        }
    %>

    <body>
        <ul>
            <li><a href="index.jsp">Home</a></li>
            <li><a href="pessoa.jsp">Cadastro</a></li>
            <li><a href="#menu3">Oportunidades</a></li>
            <li><a href="#menu4">Currículo</a></li>
        </ul>

        <br>
        <% 
        String mensagem = (String) request.getAttribute("mensagem");
        if (mensagem != null) {
        %>
        <div class="mensagem"><%= mensagem %></div>
        <%
        }
        %>

        <!-- Formulário para adicionar/atualizar uma pessoa -->
        <form method="post" action="acao?a=salvarPessoa">
            <input type="hidden" id="id_pessoa" name="id_pessoa" value="<%= p.getCodigo() %>">
            <label for="nome">Nome:</label><br>
            <input type="text" id="nome" name="nome" autocomplete="name" value="<%= p.getNome() %>" required><br><br>
            <label for="email">E-mail:</label><br>
            <input type="email" id="email" name="email" autocomplete="email" value="<%= p.getEmail() %>" required><br><br>
            <label for="telefone">Telefone:</label><br>
            <input type="tel" id="telefone" name="telefone" autocomplete="tel" value="<%= p.getTelefone() %>" required><br><br>
            <label for="data_nascimento">Data de Nascimento:</label><br>
            <input type="date" id="data_nascimento" name="data_nascimento" value="<%= p.getNascimento() != null ? p.getNascimento().toString() : "" %>" required>
            <input type="submit" name="salvar" value="Salvar">
        </form>

        <br>

        <!-- Tabela para listar todas as pessoas -->
        <% 
        ArrayList<Pessoa> pessoas = new UsuarioDAO().consultar(); 
        if (pessoas != null && !pessoas.isEmpty()) { 
        %>
        <table class="table">
            <thead>
                <tr>
                    <th>Código</th>
                    <th>Nome</th>
                    <th>E-mail</th>
                    <th>Telefone</th>
                    <th>Data de Nascimento</th>
                    <th>Ações</th>
                </tr>
            </thead>
            <tbody>
                <% for (Pessoa pessoaItem : pessoas) { %>
                <tr>
                    <td><%= pessoaItem.getCodigo() %></td>
                    <td><%= pessoaItem.getNome() %></td>      
                    <td><%= pessoaItem.getEmail() %></td>      
                    <td><%= pessoaItem.getTelefone() %></td>
                    <td><%= pessoaItem.getNascimento() %></td>
                    <td>
                        <!-- Botões para Editar e Excluir -->
                        <a href="acao?a=editarPessoa&id_pessoa=<%= pessoaItem.getCodigo() %>" class="btn btn-success">Editar</a>
                        <a href="acao?a=excluirPessoa&id_pessoa=<%= pessoaItem.getCodigo() %>" class="btn btn-danger" onclick="return confirm('Tem certeza que deseja excluir?');">Excluir</a>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
        <% } else { %>
        <p>Não há registros para exibir.</p>
        <% } %>

    </body>
    <footer>
        <div class="rodape">
            <p>&copy; 2024 Casa dos Currículos. Todos os direitos reservados.</p>
        </div>
    </footer>
</html>
