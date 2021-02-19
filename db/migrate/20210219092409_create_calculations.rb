class CreateCalculations < ActiveRecord::Migration[6.1]
  def change
    create_table :calculations do |t|
      t.decimal :initial_loan
      t.decimal :down_payment
      t.references :bank, foreign_key: true

      t.timestamps
    end
    add_index :calculations, [:bank_id, :updated_at]
  end
end
