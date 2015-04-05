class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.integer :phone_num
      t.string :carrier

      t.timestamps
    end
  end
end
