class AddArchivesToEnvelopes < ActiveRecord::Migration[5.0]
  def change
    add_column :envelopes, :archives, :integer
  end
end
