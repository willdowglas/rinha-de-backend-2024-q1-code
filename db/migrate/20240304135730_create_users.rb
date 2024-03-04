class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.integer :limit, default: 0, null: false
      t.integer :balance, default: 0, null: false
    end
  end
end
