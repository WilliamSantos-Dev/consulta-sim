Feature: medico
  As a um medico
  I want to poder criar meu cadastro no sistema e ver minhas consultas
  So that eu possa me registrar e consultar as consultas que tenho agendado

  Scenario: medico se cadastra
    Given eu estou na home do sistema
    And eu clico na opcao "Novo médico"
    When eu coloco meu dados no formulario: nome completo "William Batista", cpf "11122233344", email "william@gmail.com" ,especilidade "pediatra", crm "222333"
    And eu clico na opcao  "Create Medico"
    Then eu vejo o "William Batista" do novo medico criado

  Scenario: medico ve suas consultas agendadas
    Given eu estou na home do sistema
    And eu clico na opcao "Acessar medico"
    And procuro "meu nome" na lista
    When eu clico na opcao  "Acessar"
    Then vejo as consultas que tem agendadas para mim

