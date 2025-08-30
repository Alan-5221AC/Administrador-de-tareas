Rails.application.routes.draw do
  get 'calendario_acticvidades/index'
  get 'tareas_completadas/index'
  get 'registro_asistencias/index'
  get 'tareas_pendientes/index'
  devise_for :users
  get 'todas_tareas/index'
  resources :tareas
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'todas_tareas#index'  # Define esta como la página principal
  get 'dashboard', to: 'dashboard#index', as: 'dashboard'
  get 'tareas_pendientes', to: 'tareas_pendientes#index'
  resources :todas_tareas
  resources :tareas_pendientes
  resources :tareas_completadas
  resources :calendario_acticvidades
  resources :registro_asistencias
  resources :empleados
  resources :tareas do
    member do
      patch :completar  # Ruta para marcar una tarea como completada
    end
  end
end
