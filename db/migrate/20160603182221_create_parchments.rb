class CreateParchments < ActiveRecord::Migration[5.0]
  def change
    create_table :parchments do |t|
      t.string :s3_url
      t.integer :envelope_id

      t.timestamps
    end
  end
end
