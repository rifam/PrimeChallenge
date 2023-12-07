*** Settings ***
Library           Browser

*** Variables ***

*** Keywords ***

# Dado que o usuário está na página de cadastro de clientes na aba Perfil
Quando o usuário preenche os campos obrigatórios com dados válidos
    New Browser    browser=chromium        headless=False
    New Page       https://challenge.primecontrol.com.br/

