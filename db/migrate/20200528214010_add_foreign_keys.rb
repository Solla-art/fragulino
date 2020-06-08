class AddForeignKeys < ActiveRecord::Migration
  def change
    add_foreign_key :receipts, :shops
  end
end
