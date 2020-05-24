class Receipt < ActiveRecord::Base
    validates :shop, presence: true
    validates :employee, presence: true

    belongs_to :shop
    belongs_to :employee

    has_many :receipt_items
    accepts_nested_attributes_for :receipt_items, :allow_destroy => true
end
