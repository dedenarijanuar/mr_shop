class CreateQuotationSpareparts < ActiveRecord::Migration[6.0]
  def change
    create_table :quotation_spareparts do |t|
      t.integer :sparepart_id
      t.integer :quotation_id

      t.timestamps
    end
  end
end
