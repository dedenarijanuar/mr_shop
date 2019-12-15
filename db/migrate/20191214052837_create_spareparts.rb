class CreateSpareparts < ActiveRecord::Migration[6.0]
  def change
    create_table :spareparts do |t|
      t.string :name
      t.text :desc
      t.integer :price
      t.boolean :status

      t.timestamps
    end
  end
end
