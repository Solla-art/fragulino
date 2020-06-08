class SuperMoreForeign < ActiveRecord::Migration
  def change
    add_foreign_key :receipt_items, :receipts
  end
end
