class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :college
      t.string :dob
      t.integer :score, default: 0
      t.string :provider
      t.string :uid

      t.timestamps null: false
    end
    add_index :users, :uid
  end
end
