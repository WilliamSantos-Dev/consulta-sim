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
    if @medico.save
      redirect_to @medico, notice: 'Médico criado com sucesso.'
    else
      render :new
    end
  end

  def edit
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
