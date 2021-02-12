class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image

  belongs_to :category
  belongs_to :product_state
  belongs_to :charge_burden
  belongs_to :source_area
  belongs_to :delivery_day

  validates :image,       presence: true
  validates :name,        presence: true
  validates :description, presence: true
  validates :price,       presence: true
  validates :price,       numericality: { with: /\A[0-9]+\z/, message: 'Half-width number' }
  validates :price,
            numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'Out of setting range' }

  validates :category_id,      numericality: { other_than: 1, message: 'Select' }
  validates :product_state_id, numericality: { other_than: 1, message: 'Select' }
  validates :charge_burden_id, numericality: { other_than: 1, message: 'Select' }
  validates :source_area_id,   numericality: { other_than: 1, message: 'Select' }
  validates :delivery_day_id,  numericality: { other_than: 1, message: 'Select' }
end
