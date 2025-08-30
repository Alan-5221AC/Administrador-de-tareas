class AddPuestoToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :puesto, :string
  end
end
