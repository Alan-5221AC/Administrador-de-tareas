class TareasController < ApplicationController
 before_action :set_tarea, only: [:show, :edit, :destroy, :update]

  # GET /tareas or /tareas.json
  def index
    @tareas = Tarea.order(fecha_limite: :asc)
    @tarea = Tarea.new
  end

  # GET /tareas/1 or /tareas/1.json
  def show
    @tarea = Tarea.find(params[:id])
    @tareas = Tarea.all
  end

  # GET /tareas/new
  def new
    @tarea = Tarea.new
    redirect_to todas_tareas_path
  end

  # GET /tareas/1/edit
  def edit
  end

def completar
  @tarea = Tarea.find(params[:id])
  @tarea.update(
    completada: true,
    descripcion_completado: params[:descripcion_completado]
  )
  redirect_to tareas_completadas_path, notice: "Tarea marcada como completada."
end

  # POST /tareas or /tareas.json
  def create
    @tarea = Tarea.new(tarea_params)
    if @tarea.save
      redirect_to todas_tareas_path, notice: "Tarea creada correctamente."
    else
      @tareas = Tarea.order(fecha_limite: :asc)
      render 'todas_tareas/index', status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tareas/1 or /tareas/1.json
  def update
    respond_to do |format|
      if @tarea.update(tarea_params)
        format.html { redirect_to todas_tareas_path, notice: "Tarea was successfully updated." }
        format.json { render :show, status: :ok, location: @tarea }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tarea.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tareas/1 or /tareas/1.json
  def destroy
    @tarea.destroy

    respond_to do |format|
      format.html { redirect_to todas_tareas_path, status: :see_other, notice: "Tarea was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tarea
      @tarea = Tarea.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tarea_params
      params.require(:tarea).permit(:titulo, :descripcion, :prioridad, :PersonaAsignada, :fecha_limite, :completada,  :descripcion_completado)
    end
end
