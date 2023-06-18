class Endereco < ApplicationRecord
  belongs_to :paciente

  validates :cep, presence: true, format: { with: /\A\d{8}\z/, message: "deve conter apenas números e ter 8 dígitos" }
  validates :cidade, presence: true
  validates :bairro, presence: true
  validates :logradouro, presence: true
end
