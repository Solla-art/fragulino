class EvenMoreForeign < ActiveRecord::Migration
  def change
    add_foreign_key :receipts, :employees
    add_foreign_key :receipt_items, :items
  end
end
