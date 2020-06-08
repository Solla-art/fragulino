class ReceiptItem < ActiveRecord::Base
    validates :item, presence: true
    validates :item_count, presence: true
    
    belongs_to :item
    belongs_to :receipt, dependent: :destroy
end
