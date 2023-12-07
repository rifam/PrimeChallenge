*** Settings ***
Resource    ../resource/cadastrar_clientes_resource.robot



*** Test Cases ***
CT005 - Realizar Cadastro de Clientes com sucesso na aba Perfil
    Dado que o usuário está na página de cadastro de clientes na aba Perfil
    Quando o usuário preenche os campos obrigatórios com dados válidos
    E clica no botão de cadastrar
    Então o cliente é cadastrado com sucesso

#CT006 - Validar Pesquisa de Cliente recém cadastrado e exibição dos dados em tela
    Dado que o usuário está na página de pesquisa de clientes
    And um cliente foi cadastrado recentemente
    Quando o usuário pesquisa pelo cliente recém cadastrado
    Então os dados do cliente são exibidos corretamente em tela

#CT007 - Editar Cliente através do botão na listagem de clientes
    Dado que o usuário está na página de listagem de clientes
    And existem clientes cadastrados
    Quando o usuário clica no botão de editar para um cliente específico
    And faz as alterações desejadas
    And clica no botão de salvar
    Então as alterações são salvas com sucesso

#CT009 - Validar preenchimento de campos obrigatórios na aba Perfil
    Dado que o usuário está na página de cadastro de clientes na aba Perfil
    Quando o usuário tenta cadastrar sem preencher os campos obrigatórios
    Então uma mensagem de erro é exibida informando sobre os campos obrigatórios não preenchidos

#CT012 - Validar preenchimento "Informações do Candidato" ao clicar em "Finalizar e Enviar"
    Dado que o usuário está na página de preenchimento de "Informações do Candidato"
    Quando o usuário preenche todas as informações obrigatórias
    E clica no botão "Finalizar e Enviar"
    Então as informações do candidato são enviadas com sucesso