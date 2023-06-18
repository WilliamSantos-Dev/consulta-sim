class Paciente < ApplicationRecord
  has_one :endereco, dependent: :destroy
  accepts_nested_attributes_for :endereco
  has_many :consultas

  validates :nome_completo, presence: true
  validates :data_nascimento, presence: true
  validates :cpf, presence: true, uniqueness: true, format: { with: /\A\d{11}\z/, message: "deve conter apenas números e ter 11 dígitos" }
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: "deve ser um e-mail válido" }

  validate :validar_data_nascimento

  private

  def validar_data_nascimento
    errors.add(:data_nascimento, "não pode ser maior que a data atual") if data_nascimento.present? && data_nascimento > Date.current
  end
end
