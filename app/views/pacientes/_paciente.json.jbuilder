json.extract! paciente, :id, :nome_completo, :cpf, :email, :data_nascimento, :created_at, :updated_at
json.url paciente_url(paciente, format: :json)
