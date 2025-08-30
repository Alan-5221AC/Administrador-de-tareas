class CreateTareas < ActiveRecord::Migration[5.2]
  def change
    create_table :tareas do |t|
      t.string :titulo
      t.text :descripcion
      t.integer :prioridad, default: 0
      t.string :PersonaAsignada
      t.date :fecha_limite
      t.boolean :completada, default: false
      t.timestamps
    end
  end
end
