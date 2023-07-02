class PacientesController < ApplicationController
  before_action :set_paciente, only: [:show, :edit, :update, :destroy]

  def index
    @pacientes = Paciente.all
  end

  def show
  end

  def new
    @paciente = Paciente.new
  end

  def acessar
    @pacientes = Paciente.all
  end


  def create
    @paciente = Paciente.new(paciente_params)
    @paciente.build_endereco(endereco_params)

    respond_to do |format|
      if @paciente.save
        format.html { redirect_to paciente_url(@paciente), notice: "Paciente criado com sucesso." }
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
    result = @paciente.update(paciente_params)
    result = @paciente.endereco.update(endereco_params) && result

    respond_to do |format|
      if result
        format.html { redirect_to paciente_url(@paciente), notice: "Paciente atualizado com sucesso." }
        format.json { render :show, status: :ok, location: @paciente }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @paciente.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @paciente.destroy

    respond_to do |f|
      f.html { redirect_to pacientes_url, notice: "Paciente removido com sucesso" }
      f.json { head :no_content }
    end
  end

  private

  def set_paciente
    @paciente = Paciente.find(params[:id])
  end

  def new_consulta
    @consulta = Consulta.new
  end

  def paciente_params
    params.require(:paciente).permit(:nome_completo, :data_nascimento, :cpf, :email)
  end
  def endereco_params
    params.require(:endereco).permit(:cep, :cidade, :bairro, :logradouro, :complemento, :paciente_id)
  end
end
