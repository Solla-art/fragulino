class AddTotalToReceipts < ActiveRecord::Migration
  def change
    add_column :receipts, :total, :integer
  end
end
