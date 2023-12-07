






*** Test Cases ***

CT001 - Criar uma nova Conta com sucesso
    Dado que o usuário está na página de cadastro
    Quando o usuário preenche os campos obrigatórios com dados válidos
    E clica no botão de criar conta
    Então a conta é criada com sucesso

CT002 - Validar criação de uma conta com Email já cadastrado
    Dado que o usuário está na página de cadastro
    E um usuário com o mesmo Email já está cadastrado
    Quando o usuário tenta criar uma conta com o mesmo Email
    Entao uma mensagem de erro é exibida informando sobre o Email duplicado

CT008 - Validar Cadastro de Clientes com Email inválido na aba Perfil
    Dado que o usuário está na página de cadastro de clientes na aba Perfil
    Quando o usuário preenche o campo de Email com um formato inválido
    E clica no botão de cadastrar
    Entao uma mensagem de erro é exibida informando sobre o Email inválido
