class AddFileToParchments < ActiveRecord::Migration[5.0]
  def change
    add_column :parchments, :file, :string
  end
end
