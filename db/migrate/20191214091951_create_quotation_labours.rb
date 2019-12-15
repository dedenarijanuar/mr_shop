class CreateQuotationLabours < ActiveRecord::Migration[6.0]
  def change
    create_table :quotation_labours do |t|
      t.integer :labour_id
      t.integer :quotation_id

      t.timestamps
    end
  end
end
