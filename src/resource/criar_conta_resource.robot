*** Settings ***
Library      Browser


*** Variables ***


${email}    testep@tmail.com
${senha}    123456


*** Keywords ***

#CT001 - Criar uma nova Conta com sucesso
Dado que o usuário está na página inicial
    New Browser    browser=chromium        headless=False
    New Page       https://challenge.primecontrol.com.br/
    
    Wait For Elements State   div h1    visible    5000 
    Get Text    div h1    equals    Uma plataforma de desafio técnico para testes automatizados.
    Click       css=a.btn.btn-dark.btn-lg.btn-banner

    Get Text    div h1    equals    Criar Conta

Quando o usuário preenche os campos obrigatórios com dados válidos
    
    Wait For Elements State   div h1    visible    5000
    Get Text    div h1    equals    Criar Conta

    Fill Text  css=input[type="email"]                  ${email}  
    Fill Text  css=input[type="password"]               ${senha}


E clica no botão de criar conta

    Click       css=button[type="button"]
    Sleep       3s
    Fill Text  css=input[type="password"]               ${senha}
    Click       css=button[type="button"]

Então a conta é criada com sucesso

    Wait For Elements State   div h1    visible    5000 
    Get Text    div h1    equals    Gestão de Clientes

    Close Browser

#CT002 - Validar criação de uma conta com Email já cadastrado

Dado que o usuário está na página de cadastro
    
    New Browser    browser=chromium        headless=False
    New Page       https://challenge.primecontrol.com.br/app/novaconta


E um usuário com o mesmo Email já está cadastrado
    
    Wait For Elements State   div h1    visible    5000
    Get Text    div h1    equals    Criar Conta

    Fill Text  css=input[type="email"]                  ${email}  
    Fill Text  css=input[type="password"]               ${senha}

Quando o usuário tenta criar uma conta com o mesmo Email

    Click       css=button[type="button"]

Entao uma mensagem de erro é exibida informando sobre o Email duplicado
    
    Wait For Elements State   div[role="alert"]    visible    5000 
    Get Text    div[role="alert"]    equals    Esse email já está em uso por outra conta
