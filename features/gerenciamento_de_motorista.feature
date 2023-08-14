Feature: Gerenciamento de Motorista
  As a Usuario do sistema
  I want to registrar, editar, exibir e remover um motorista de onibus
  So that eu saiba qual veiculo e motorista estao em uma rota

  Scenario: Registro de motorista com informacoes validas
    Given eu que sou um usuario do sistema
    When eu acesso a pagina de registro do motorista
    And o motorista de nome: "Jose Almeida", cpf: "12345678910", email: "jose@gmail.com", senha: "123456!", telefone: "11123456789" , e cnh: "1234567891", existe
    And clico no botao para cadastrar o motorista
    Then vejo uma mensagem de confirmacao de registro do motorista

  Scenario: Registro de motorista com informacoes invalidas
    Given eu que sou um usuario do sistema
    When eu acesso a pagina de registro do motorista
    And clico no botao para cadastrar o motorista
    Then vejo uma mensagem informando que nao e possivel cadastrar o motorista

  Scenario: Atualizar email do motorista
    Given eu que sou um usuario do sistema
    And existe um motorista registrado com cpf '12345678911'
    When eu acesso a pagina de edicao do motorista com o cpf '12345678911'
    And eu atualizo o email do motorista para "josealmeida@gmail.com"
    And clico para atualizar o motorista
    Then aparece uma mensagem dizendo que a motorista foi atualizado com sucesso

  Scenario: Remocao de um motorista do sistema
    Given eu que sou um usuario do sistema
    And existe um motorista registrado com cpf '12345678910'
    When eu acesso a pagina de visualizacao do motorista com o cpf '12345678910'
    And eu clico para excluir o motorista
    Then aparece uma mensagem dizendo que o motorista foi excluido com sucesso

  Scenario: Atualizar motorista com telefone invalido
    Given eu que sou um usuario do sistema
    And existe um motorista registrado com cpf '12345678920'
    When eu acesso a pagina de edicao do motorista com o cpf '12345678920'
    And atualizo o telefone do motorista para '58795'
    And clico para atualizar o motorista
    Then vejo uma mensagem de falha ao tentar atualizar o telefone
