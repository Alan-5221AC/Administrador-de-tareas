class TareasCompletadasController < ApplicationController
  def index
    @tareas_completadas = Tarea.where(completada: true)
    if params[:prioridad].present?
      @tareas_completadas = @tareas_completadas.where(prioridad: params[:prioridad].to_i)
    end
    if params[:fecha] == "hoy"
      @tareas_completadas = @tareas_completadas.where(fecha_limite: Date.today)
    end
    @tareas_completadas = @tareas_completadas.order(fecha_limite: :desc)
  end
end