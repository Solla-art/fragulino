class AddMoreForeignKeys < ActiveRecord::Migration
  def change
    add_foreign_key :accounts, :employees
    add_foreign_key :employees, :departments
    add_foreign_key :employees, :shops
  end
end
