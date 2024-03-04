class CreateTransactions < ActiveRecord::Migration[7.1]
  def change
    create_table :transactions do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :amount, default: 0, null: false
      t.string :description, limit: 10, null: false
      t.boolean :kind, null: false
      t.datetime :created_at, null: false
    end
  end
end
