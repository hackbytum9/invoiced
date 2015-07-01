class Invoice < ActiveRecord::Base
  has_many :line_items, dependent: :delete_all

  validates :number, presence: true

  accepts_nested_attributes_for :line_items
end