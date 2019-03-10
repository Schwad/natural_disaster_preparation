class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.text :phone_number
      t.text :configurations
      t.text :queries

      t.timestamps
    end
  end
end
