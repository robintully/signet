class CreateArchives < ActiveRecord::Migration[5.0]
  def change
    create_table :archives do |t|
      t.references :envelope
      t.binary     :archive_file
    end
  end
end
