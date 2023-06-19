class Paciente < ApplicationRecord
  has_one :endereco, dependent: :destroy
  accepts_nested_attributes_for :endereco
  has_many :consultas

  validate :data_nascimento_maior_hoje
  validates :nome_completo, presence: true, length: { minimum: 10 }
  validates :cpf, presence: true, uniqueness: true, format: { with: /\A\d{11}\z/, message: 'deve conter apenas números e ter 11 dígitos' }
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: 'deve ser um endereço de e-mail válido' }
  private
  def data_nascimento_maior_hoje
    errors.add(:data_nascimento, "não pode ser maior que a data de hoje") if data_nascimento.present? && data_nascimento > Date.current
  end
end
