class MedicosController < ApplicationController
  before_action :set_medico, only: [:show, :edit, :update, :destroy]

  def index
    @medicos = Medico.all
  end

  def show
  end

  def new
    @medico = Medico.new
  end

  def create
    @medico = Medico.new(medico_params)

    respond_to do |format|
      if @medico.save
        format.html { redirect_to medico_url(@medico), notice: "Medico was successfully created." }
        format.json { render :show, status: :created, location: @medico }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @medico.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @medico.update(medico_params)
      redirect_to @medico, notice: 'Médico atualizado com sucesso.'
    else
      render :edit
    end
  end

  def destroy
    @medico.destroy
    redirect_to medicos_url, notice: 'Médico removido com sucesso.'
  end

  private

  def set_medico
    @medico = Medico.find(params[:id])
  end

  def medico_params
    params.require(:medico).permit(:nome_completo, :cpf, :email, :especialidade, :crm)
  end
end
