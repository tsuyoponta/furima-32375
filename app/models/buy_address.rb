class BuyAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :source_area_id, :city, :block, :building_name, :phone_number, :buy_id

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :phone_number, format: { with: /\A[0-9]{11}\z/, message: "is invalid. Don't include hyphen(-). Within 11 digits" }
    validates :source_area_id, :city, :block, :building_name
  end

  def save
    Buy.create(user_id: user.id, item_id: item.id)
    Address.create(postal_code: postal_code, source_area_id: source_area_id, city: city, block: block, building_name: building_name, phone_number: phone_number, buy_id: buy.id)
  end
end