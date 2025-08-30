class EmpleadosController < ApplicationController
  def index
    @empleados = User.all
    @empleado = User.new
    if params[:search].present?
      @empleados = User.where("nombre ILIKE :query OR numero_control ILIKE :query OR apellidos ILIKE :query", query: "%#{params[:search]}%")
                       .paginate(page: params[:page], per_page: 10)
    else
      @empleados = User.paginate(page: params[:page], per_page: 10)
    end
  end

  def edit
    @empleado = User.find(params[:id])
  end

  def create
    @empleado = User.new(empleado_params)
    if @empleado.save
      redirect_to empleados_path, notice: "Empleado registrado correctamente."
    else
      if params[:search].present?
        @empleados = User.where("nombre ILIKE :query OR apellidos ILIKE :query OR numero_control ILIKE :query", query: "%#{params[:search]}%")
                         .paginate(page: params[:page], per_page: 10)
      else
        @empleados = User.paginate(page: params[:page], per_page: 10)
      end
      render :index
    end
  end

  def update
    @empleado = User.find(params[:id])
    if @empleado.update(empleado_params)
      redirect_to empleados_path, notice: "Empleado actualizado correctamente."
    else
      @empleados = User.paginate(page: params[:page], per_page: 10)
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @empleado = User.find(params[:id])
    @empleado.destroy
    redirect_to empleados_path, notice: "Empleado eliminado correctamente."
  end

  private

  def empleado_params
    params.require(:user).permit(:nombre, :apellidos, :email, :puesto, :phone_number, :hora_entrada, :hora_salida)
  end
end