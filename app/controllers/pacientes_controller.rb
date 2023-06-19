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

  def acessar
    @pacientes = Paciente.all
  end


  def create
    @paciente = Paciente.new(paciente_params)
    respond_to do |format|
      if @paciente.save
        format.html { redirect_to medico_url(@paciente), notice: "Paciente cadastrado com sucesso!." }
        format.json { render :show, status: :created, location: @paciente }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @paciente.errors, status: :unprocessable_entity }
      end
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

  def new_consulta
    @consulta = Consulta.new
  end

  def paciente_params
    params.require(:paciente).permit(:nome_completo, :data_nascimento, :cpf, :email, endereco_attributes: [:cep, :cidade, :bairro, :logradouro, :complemento])
  end
end
