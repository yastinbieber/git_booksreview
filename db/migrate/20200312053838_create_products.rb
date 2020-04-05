class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :bookname
      t.string :author
      t.integer :user_id
      t.timestamps null: true
    end
  end
end
