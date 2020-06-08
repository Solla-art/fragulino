class Receipt < ActiveRecord::Base
    validates :shop, presence: true
    validates :employee, presence: true

    belongs_to :shop
    belongs_to :employee

    has_many :receipt_items, :dependent => :destroy
    accepts_nested_attributes_for :receipt_items, :allow_destroy => true

    def update_total 
      self.total = self.receipt_items.inject(0) { |total, receipt_item| total + receipt_item.item.price * receipt_item.item_count }
    end

    def update_total!
      self.update_total
      self.save!
    end
end
