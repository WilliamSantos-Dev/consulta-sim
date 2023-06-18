class PacientesController < ApplicationController
  before_action :set_paciente, only: [:show, :edit, :update, :destroy]

  def index
    @pacientes = Paciente.all
  end

  def show
  end

  def new
    @paciente = Paciente.new
    @paciente.build_endereco
  end

  def create
    @paciente = Paciente.new(paciente_params)
    if @paciente.save
      redirect_to @paciente, notice: 'Paciente cadastrado com sucesso.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @paciente.update(paciente_params)
      redirect_to @paciente, notice: 'Paciente atualizado com sucesso.'
    else
      render :edit
    end
  end

  def destroy
    @paciente.destroy
    redirect_to pacientes_url, notice: 'Paciente removido com sucesso.'
  end

  private

  def set_paciente
    @paciente = Paciente.find(params[:id])
  end

  def paciente_params
    params.require(:paciente).permit(:nome_completo, :data_nascimento, :cpf, :email, endereco_attributes: [:cep, :cidade, :bairro, :logradouro, :complemento])
  end
end
