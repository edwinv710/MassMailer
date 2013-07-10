class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.string :filename
      t.string :path
      t.binary :data

      t.timestamps
    end
  end
end
