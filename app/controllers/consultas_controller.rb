class ConsultasController < ApplicationController
  def new
    @consulta = Consulta.new
  end

  def create
    @consulta = Consulta.new(consulta_params)

    if @consulta.save
      redirect_to consulta_path(@consulta), notice: 'Consulta agendada com sucesso.'
    else
      render :new
    end
  end


  def edit
    @consulta = Consulta.find(params[:id])
  end

  def update
    @consulta = Consulta.find(params[:id])

    if @consulta.update(consulta_params)
      redirect_to @consulta, notice: 'Consulta atualizada com sucesso.'
    else
      render :edit
    end
  end

  def show
    @consulta = Consulta.find(params[:id])
  end

  def index
    @consultas = Consulta.all
  end

  private

  def consulta_params
    params.require(:consulta).permit(:data_hora, :paciente_id, :medico_id)
  end
end
