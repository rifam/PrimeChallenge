*** Settings ***
Resource    ../resource/recuperar_senha_resource.robot


*** Test Cases ***
CT011 - Recuperar senha de acesso
    Dado que o usuário está na página de recuperação de senha
    Quando o usuário insere seu Email válido e solicita a recuperação
    Então uma mensagem de sucesso é exibida informando sobre o processo de recuperação
