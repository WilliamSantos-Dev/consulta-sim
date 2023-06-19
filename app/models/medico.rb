class Medico < ApplicationRecord
  has_many :consultas

  validates :nome_completo, presence: { message: "Informe o nome" }
  validates :cpf, presence: { message: "Informe o CPF" }, uniqueness: { message: "CPF em uso." }, format: { with: /\A\d{11}\z/, message: "O CPF deve conter apenas números e ter 11 dígitos." }
  validates :email, presence: { message: "Informe o email." }, uniqueness: { message: "Este email está em uso." }, format: { with: URI::MailTo::EMAIL_REGEXP, message: "O email é válido." }
  validates :especialidade, presence: { message: "Informe a especialidade." }
  validates :crm, presence: { message: "Informe o CRM" }, uniqueness: { message: "Este CRM já está em uso." }
end
