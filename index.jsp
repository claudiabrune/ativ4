<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="icon" href="favicon.ico" type="image/x-icon">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Casa dos Currículos</title>
        <link rel="stylesheet" type="text/css" href="estilo.css">
    </head>
    <body>
        <ul>
            <li><a class="active" href="index.jsp">Home</a></li>
            <li><a href="#" onclick="openLoginModal()">Cadastro</a></li>
            <li><a href="#menu3">Oportunidades</a></li>
            <li><a href="#menu4">Currículo</a></li>
        </ul>

        <h1>CASA DOS CURRÍCULOS</h1>
        <h2>Onde seu currículo dá match na melhor oportunidade</h2>
        <h3>Preencha seu currículo e conheça as melhores oportunidades do mercado de trabalho. Alavanque sua carreira.</h3>
    

    <!-- Modal de Login -->
    <div id="loginModal" style="display:none; position:fixed; top:0; left:0; width:100%; height:100%; background-color:rgba(0,0,0,0.5);">
        <div style="background:#fff; margin:15% auto; padding:20px; width:300px; text-align:center;">
            <h2>Login</h2>
            <input type="text" id="nome" placeholder="Usuário" required>
            <input type="password" id="senha" placeholder="Senha" required>
            <button onclick="submitLogin()">Entrar</button>
            <button onclick="closeLoginModal()">Cancelar</button>
        </div>
    </div>

    <script>
        function openLoginModal() {
            document.getElementById('loginModal').style.display = 'block';
        }

        function closeLoginModal() {
            document.getElementById('loginModal').style.display = 'none';
        }

        function submitLogin() {
            const nome = document.getElementById('nome').value;
            const senha = document.getElementById('senha').value;

            // Envia os dados para o servlet
            const xhr = new XMLHttpRequest();
            xhr.open("POST", "acao", true);
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            xhr.onreadystatechange = function () {
                if (xhr.readyState === XMLHttpRequest.DONE) {
                    if (xhr.status === 200) {
                        window.location.href = 'pessoa.jsp'; // Redireciona para a página de cadastro se bem-sucedido
                    } else {
                        alert('Usuário ou senha inválidos.');
                        // Limpa os campos após um login inválido
                        document.getElementById('nome').value = '';
                        document.getElementById('senha').value = '';
                    }
                }
            };
            xhr.send("a=login&nome=" + encodeURIComponent(nome) + "&senha=" + encodeURIComponent(senha));
        }
    </script>
</body>
<footer>
    <div class="rodape">
        <p>&copy; 2024 Casa dos Currículos. Todos os direitos reservados.</p>
    </div>
</footer>
</html>
