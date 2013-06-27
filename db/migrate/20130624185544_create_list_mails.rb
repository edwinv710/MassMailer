class CreateListMails < ActiveRecord::Migration
  def change
    create_table :list_mails do |t|
    	t.string :name
    	t.string :server_list_id
    	t.string :mailing_list_id
    	t.string :message_id
    	t.boolean :completed
    	t.integer :priority
    	
      t.timestamps
    end
  end
end
