class AddDescripcionCompletadoToTareas < ActiveRecord::Migration[5.2]
  def change
    add_column :tareas, :descripcion_completado, :text
  end
end
