class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :status
      t.boolean :admin
      t.index :email
      t.timestamps null: false
    end
  end
end
