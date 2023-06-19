Rails.application.routes.draw do
  root 'home#index'
  get '/home', to: 'home#index'
  get '/acessar_paciente', to: 'pacientes#acessar', as: 'acessar_paciente'

  resources :pacientes do
    resource :endereco, only: [:new, :create, :edit, :update, :destroy]
  end

  resources :medicos

  resources :consultas
end
