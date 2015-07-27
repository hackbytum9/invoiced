class Invoice < ActiveRecord::Base
  has_many :line_items, dependent: :destroy
  belongs_to :customer
  validates :number, presence: true

  accepts_nested_attributes_for :line_items
  after_touch  :calculate_total
  after_initialize :up_number, :if => :new_record?

  def calculate_total
      sum = 0
      items = self.line_items.all
      items.each do |item|
        sum = sum + (item.quantity.to_i * item.price.to_i)
      end
      self.total = sum
      self.save
  end

  # # def summation(sum)

  # #     self.total = sum
  # #     self.save
  # end

  def up_number
    unless number
      if Invoice.count == 0
        self.number = '001'
      else
        last_invoice = Invoice.order(:number).last
        self.number = last_invoice.number.succ
      end
    end
  end

end