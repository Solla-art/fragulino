class Employee < ActiveRecord::Base
    belongs_to :shop
    belongs_to :department
    has_one :account
    before_destroy :delete_account
    has_many :receipts

    def destroy_account
        account.delete
    end

end
