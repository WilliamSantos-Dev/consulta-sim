Rails.application.routes.draw do
  Rails.application.routes.draw do
    resources :pacientes do
      resource :endereco, only: [:new, :create, :edit, :update, :destroy]
    end
  end

end
