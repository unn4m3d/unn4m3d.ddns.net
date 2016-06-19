class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content
      t.belongs_to :user, index: true, foreign_key: true
      t.datetime :post_date
      t.references :comment, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
