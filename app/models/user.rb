class User < ApplicationRecord
  has_many :asistencias, dependent: :destroy
  devise :database_authenticatable, :registerable,
      :recoverable, :rememberable, :validatable

      before_save :set_numero_control, on: :create

      validates :nombre, :apellidos, :email, :puesto, :phone_number, :hora_entrada, :hora_salida, presence: true
      validates :phone_number, format: { with: /\A\d{10}\z/, message: "Debe tener 10 dígitos" }

   #Sobreescribe la validación de Devise para permitir usuarios sin contraseña
  def password_required?
    false
  end

  private

  def set_numero_control
    if self.numero_control.blank?
      self.numero_control = loop do
        random_num = "NC#{rand(10000000..99999999)}"
        break random_num unless User.exists?(numero_control: random_num)
      end
    end
  end
end