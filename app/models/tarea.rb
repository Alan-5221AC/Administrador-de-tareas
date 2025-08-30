class Tarea < ApplicationRecord

  validates :titulo, :descripcion, :prioridad, :PersonaAsignada, :fecha_limite, presence: true
  
  def prioridad_texto
    case prioridad
    when 1 then "Baja"
    when 2 then "Media"
    when 3 then "Alta"
    when 4 then "Urgente"
    else "Sin prioridad"
    end
  end
  def prioridad_clase
    case prioridad
    when 1 then "bg-info text-dark"      # Baja
    when 2 then "bg-primary"             # Media
    when 3 then "bg-warning text-dark"   # Alta
    when 4 then "bg-danger"              # Urgente
    else "bg-secondary"
    end
  end
end