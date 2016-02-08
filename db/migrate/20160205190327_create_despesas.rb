class CreateDespesas < ActiveRecord::Migration
  def change
    create_table :despesas do |t|
      t.date :data
      t.time :time
      t.string :description
      t.integer :amount
      t.string :comment

      t.timestamps null: false
    end
  end
end
