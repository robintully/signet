class AddAttachmentParcelToParchments < ActiveRecord::Migration
  def self.up
    change_table :parchments do |t|
      t.attachment :parcel
    end
  end

  def self.down
    remove_attachment :parchments, :parcel
  end
end
