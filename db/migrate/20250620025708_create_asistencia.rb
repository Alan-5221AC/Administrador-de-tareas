class CreateAsistencia < ActiveRecord::Migration[5.2]
  def change
    create_table :asistencia do |t|
      t.references :user, foreign_key: true
      t.date :fecha, null: false
      t.time :hora_entrada, null: false
      t.time :hora_salida, null: false
      t.text :observaciones
      t.integer :modalidad, default: 0 # 0: Presencial, 1: Remoto, 2: vacaciones, 3: Permiso
      t.timestamps
    end
  end
end
