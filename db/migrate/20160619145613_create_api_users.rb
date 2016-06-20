class CreateApiUsers < ActiveRecord::Migration
  def change
    create_table :api_users do |t|
      t.text :token
      t.string :name

      t.timestamps null: false
    end
  end
end
