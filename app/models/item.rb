class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image

  belongs_to :category
  belongs_to :product_state
  belongs_to :charge_burden
  belongs_to :source_area
  belongs_to :delivery_day

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :price
  end

  validates :price, numericality: { with: /\A[0-9]+\z/, message: 'Half-width number' }
  validates :price, numericality: {
    greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'Out of setting range'
  }

  with_options numericality: { other_than: 1, message: 'Select' } do
    validates :category_id
    validates :product_state_id
    validates :charge_burden_id
    validates :source_area_id
    validates :delivery_day_id
  end
end
