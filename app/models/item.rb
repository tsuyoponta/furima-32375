class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image
  
  belongs_to :category
  belongs_to :product_state
  belongs_to :charge_burden
  belongs_to :source_area
  belongs_to :delivery_day

  validates :name,             presence: true
  validates :description,      presence: true
  validates :price,            presence: true

  validates :category_id,      numericality: { other_than: 1 }
  validates :product_state_id, numericality: { other_than: 1 }
  validates :charge_burden_id, numericality: { other_than: 1 }
  validates :source_area_id,   numericality: { other_than: 1 }
  validates :delivery_day,     numericality: { other_than: 1 }
end
