class CreateQuotes < ActiveRecord::Migration
  def change
    create_table :quotes do |t|
      t.bigint :cid
      t.bigint :qid
      t.text :text
      t.string :author
      t.string :date
      t.bigint :rating

      t.timestamps null: false
    end
  end
end
