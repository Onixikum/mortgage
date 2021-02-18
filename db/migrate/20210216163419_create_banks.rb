class CreateBanks < ActiveRecord::Migration[6.1]
  def change
    create_table :banks do |t|
      t.string :bank_name, unique: true
      t.float :interest_rate
      t.decimal :maximum_loan
      t.float :minimum_down_payment
      t.integer :loan_term

      t.timestamps
    end
  end
end
