*** Settings ***

Resource    ../resource/realizar_login_resource.robot



*** Test Cases ***
CT003 - Realizar Login com sucesso
    Dado que o usuário está na página de login
    Quando o usuário insere suas credenciais corretas
    E clica no botão de login
    Então o usuário é redirecionado para a página principal logado

CT004 - Validar Login com senha inválida
    Dado que o usuário está na página de login 2
    Quando o usuário insere uma senha incorreta
    E clica no botão de login 2
    Então uma mensagem de erro é exibida informando sobre a senha inválida

CT010 - Realizar Logout com sucesso ao clicar em "Finalizar"
    Dado que o usuário está logado
    Quando o usuário clica no botão de logout
    Então o usuário é deslogado com sucesso
