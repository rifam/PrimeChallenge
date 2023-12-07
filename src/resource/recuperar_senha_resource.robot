*** Settings ***
Documentation     Teste de recuperação de senha
Library           Browser


*** Variables ***
${email}    testep@tmail.com
${senha}    123456
${senha_invalida}    1234567
${url}      https://challenge.primecontrol.com.br


*** Keywords ***

#CT011 - Recuperar senha de acesso
Dado que o usuário está na página de recuperação de senha
    
    New Browser    browser=chromium        headless=False
    New Page       ${url}/app/resetsenha
    
    Wait For Elements State   form h1    visible    5000
    Get Text                  form h1    equals    Recuperar Senha
  
Quando o usuário insere seu Email válido e solicita a recuperação

    Fill Text  css=input[type="email"]                  ${email}
    Click       css=button[type="button"]

Então uma mensagem de sucesso é exibida informando sobre o processo de recuperação

    Wait For Elements State   div[role="alert"]    visible    5000 
    Get Text    div[role="alert"]    equals    Email enviado com sucesso

    Close Browser


