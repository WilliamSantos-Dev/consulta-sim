require "test_helper"

class MedicoTest < ActiveSupport::TestCase
  test "Medico válido" do
    medico = Medico.new(
      nome_completo: "Nome medico completo",
      cpf: "12345678911",
      email: "medico@medico.com",
      especialidade: "Pedriatria",
      crm: "123456"
    )
    assert medico.save
  end

  test "Nao salvar CRM ja cadastrado" do
    medico = Medico.new(
      nome_completo: "Nome medico completo",
      cpf: "12345678911",
      email: "medico@medico.com",
      especialidade: "Pedriatria",
      crm: "123456"
    )
    medico2 = Medico.new(
      nome_completo: "Nome medico dois",
      cpf: "11122233311",
      email: "medico@medicodois.com",
      especialidade: "Pedriatria",
      crm: "123456"
    )
    medico2.save
    assert_not medico.save
  end
end


