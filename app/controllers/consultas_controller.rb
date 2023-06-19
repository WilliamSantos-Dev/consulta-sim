class ConsultasController < ApplicationController
  def new
    @consulta = Consulta.new
  end

  def create
    @consulta = Consulta.new(consulta_params)
    respond_to do |format|
      if @consulta.save
        format.html { redirect_to medico_url(@consulta), notice: "Consulta agendada!." }
        format.json { render :show, status: :created, location: @consulta }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @consulta.errors, status: :unprocessable_entity }
      end
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
