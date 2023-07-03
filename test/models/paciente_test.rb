require "test_helper"

class PacienteTest < ActiveSupport::TestCase


  test "Paciente com cpf invalido" do
    paciente = Paciente.new(
      nome_completo: "William Batista",
      cpf: "123",
      data_nascimento: Date.new(2000, 1, 1),
      email: "exemple exemple")
    assert_not paciente.save
  end

  test "Paciente com email invalido" do
    paciente = Paciente.new(
      nome_completo: "Nome paciente exemple",
      cpf: "12345678911",
      data_nascimento: Date.new(2000, 1, 1),
      email: "123456")
    assert_not paciente.save

  end


end
