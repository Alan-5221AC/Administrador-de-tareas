# app/controllers/todas_tareas_controller.rb
class TodasTareasController < ApplicationController
  def index
    @tareas = Tarea.order(fecha_limite: :asc)
    @tarea = Tarea.new
  end
end