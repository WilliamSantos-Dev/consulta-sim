class Medico < ApplicationRecord
  has_many :consultas

  validates :nome_completo, presence: true
  validates :cpf, presence: true, uniqueness: true, format: { with: /\A\d{11}\z/, message: "deve conter apenas números e ter 11 dígitos" }
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: "deve ser um e-mail válido" }
  validates :especialidade, presence: true
  validates :crm, presence: true, uniqueness: true
end
