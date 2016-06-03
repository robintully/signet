class CreateEnvelopes < ActiveRecord::Migration[5.0]
  def change
    create_table :envelopes do |t|
      t.integer :user_id
      t.string :slug
      t.datetime :expiration
      t.string :password_digest

      t.timestamps
    end
  end
end
