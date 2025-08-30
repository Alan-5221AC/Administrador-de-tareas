class RenameAsistenciaToAsistencias < ActiveRecord::Migration[5.2]
  def change
    rename_table :asistencia, :asistencias
  end
end