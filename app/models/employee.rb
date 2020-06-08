class Employee < ActiveRecord::Base
    belongs_to :shop
    belongs_to :department
    has_one :account, dependent: :destroy
    has_many :receipts
end
