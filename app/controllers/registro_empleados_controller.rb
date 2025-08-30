class RegistroEmpleadosController < ApplicationController
  def index
    @registro_empleados = User.all
    @registro_empleado = User.new
  end

  def create
    @registro_empleado = User.new(registro_empleado_params)
    if @registro_empleado.save
      redirect_to registro_empleados_path, notice: "Empleado registrado correctamente."
    else
      @registro_empleados = User.all
      render :index
    end
  end

  private

  def registro_empleado_params
    params.require(:user).permit(:nombre, :apellidos, :email, :puesto, :phone_number, :numero_control, :hora_entrada, :hora_salida, :password, :password_confirmation)
  end
end