class ChangeReceiptTotalToNumber < ActiveRecord::Migration
  def change
    change_column :receipts, :total, :float
  end
end
