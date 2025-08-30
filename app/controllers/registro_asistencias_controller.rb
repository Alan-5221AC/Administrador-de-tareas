class RegistroAsistenciasController < ApplicationController
  def index
    @asistencias = Asistencia.includes(:user).order(fecha: :desc)
    @asistencia = Asistencia.new
    @empleados = User.all

    if params[:search].present?
      @asistencias = @asistencias.joins(:user)
        .where("users.nombre ILIKE :query OR users.numero_control ILIKE :query OR users.apellidos ILIKE :query", query: "%#{params[:search]}%")
    end
  end

  def create
    @asistencia = Asistencia.new(asistencia_params)
    if @asistencia.save
      redirect_to registro_asistencias_path, notice: "Asistencia registrada correctamente."
    else
      @asistencias = Asistencia.includes(:user).order(fecha: :desc)
      @empleados = User.all
      render :index
    end
  end

  private

  def asistencia_params
    params.require(:asistencia).permit(:user_id, :fecha, :hora_entrada, :hora_salida, :observaciones, :modalidad)
  end
end