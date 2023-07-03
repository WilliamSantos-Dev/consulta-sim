require "test_helper"

class ConsultumTest < ActiveSupport::TestCase
  test "Consulta inválida - sem médico" do
    paciente = Paciente.create(
      nome_completo: "Nome completo do Paciente",
      cpf: "12345678901",
      data_nascimento: Date.new(2000, 1, 1),
      email: "exemple@exemple.com"
    )

    consulta = Consulta.new(
      paciente: paciente,
      medico: nil,
      data_hora: DateTime.current + 1.day
    )
    assert_not consulta.save
    assert_nil consulta.medico_id
  end


  test "Consulta inválida com data_hora no passado" do
    paciente = Paciente.create(
      nome_completo: "Nome completo do Paciente",
      cpf: "12345678911",
      email: "email@example.com",

    )

    medico = Medico.create(
      nome_completo: "Nome completo medico",
      cpf: "11122211122",
      email: "medico@gmail.com",
      especialidade: "pediatra",
      crm: "654321"
    )

    consulta = Consulta.new(
      paciente: paciente,
      medico: medico,
      data_hora: DateTime.current - 1.day
    )
    assert_not consulta.save
  end
end
