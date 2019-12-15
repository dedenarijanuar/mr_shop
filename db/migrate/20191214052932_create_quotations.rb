class CreateQuotations < ActiveRecord::Migration[6.0]
  def change
    create_table :quotations do |t|
      t.integer :total_price
      t.integer :discount

      t.timestamps
    end
  end
end
