class Consulta < ApplicationRecord
  belongs_to :paciente
  belongs_to :medico

  validates :data_hora, presence: true
  validate :validar_data_hora

  private

  def validar_data_hora
    errors.add(:data_hora, "não pode estar no passado") if data_hora.present? && data_hora < DateTime.current
  end
end
