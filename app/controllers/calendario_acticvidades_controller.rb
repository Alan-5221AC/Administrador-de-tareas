class CalendarioActicvidadesController < ApplicationController
  def index
    @tareas = Tarea.order(fecha_limite: :asc)
  end
end