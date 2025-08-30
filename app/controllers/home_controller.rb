class HomeController < ApplicationController
  def index
    # Lógica opcional aquí
    @tareas = Tarea.all
    respond_to do |format|
      format.html  # Esto busca automáticamente index.html.erb
    end
    @tarea = Tarea.new
    @tareas = Tarea.all.order(fecha_limite: :asc)  # Ordena las tareas por fecha de creación

  end
end