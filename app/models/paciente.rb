class Paciente < ApplicationRecord
  has_one :endereco, dependent: :destroy
  accepts_nested_attributes_for :endereco
  has_many :consultas

  validate :data_nascimento_maior_hoje
  validates :nome_completo, presence: { message: "Informe um nome valido." }, length: { minimum: 10, message: "Informe um nome válido" }
  validates :cpf, presence: { message: "Informe o CPF." }, uniqueness: { message: "Este CPF já está em uso." }, format: { with: /\A\d{11}\z/, message: "O CPF deve conter apenas números e ter 11 dígitos." }
  validates :email, presence: { message: "O email é obrigatório." }, uniqueness: { message: "Este email já está em uso." }, format: { with: URI::MailTo::EMAIL_REGEXP, message: "Informe um email válido." }

  private

  def data_nascimento_maior_hoje
    errors.add(:data_nascimento, "não pode ser maior que a data de hoje.") if data_nascimento.present? && data_nascimento > Date.current
  end
end
