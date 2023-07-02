class ConsultasController < ApplicationController
  def new
    @consulta = Consulta.new
  end

  def create
    @consulta = Consulta.new(consulta_params)
    @paciente = consulta_params[:paciente_id]
    @medico = consulta_params[:medico_id]

    respond_to do |format|
      if @consulta.save
        format.html { redirect_to consulta_url(@consulta), notice: "Consulta criada com sucesso." }
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
    @paciente = consulta_params[:paciente_id]
    respond_to do |format|
      if @consulta.update(consulta_params)
        format.html { redirect_to consulta_url(@consulta), notice: "Consulta atualizada com sucesso." }
        format.json { render :show, status: :ok, location: @consulta }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @consulta.errors, status: :unprocessable_entity }
      end
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

  def paciente_params
    params.require(:paciente).permit(:nome, :cpf, :email, :nascimento)
  end

  def medico_params
    params.require(:medico).permit(:nome, :cpf, :email, :especialidade, :crm)
  end
end
