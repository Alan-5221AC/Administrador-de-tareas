class TareasPendientesController < ApplicationController
  def index
    @tareas_pendientes = Tarea.where(completada: false)
    @tarea = Tarea.new
    if params[:prioridad].present?
      @tareas_pendientes = @tareas_pendientes.where(prioridad: params[:prioridad].to_i)
    end
    @tareas_pendientes = @tareas_pendientes.order(fecha_limite: :asc)
  end
end