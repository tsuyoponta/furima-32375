class BuyAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :source_area_id, :city, :block, :building_name, :phone_number, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'Input correctly' }
    validates :phone_number, format: { with: /\A0[5789]0\d{4}\d{4}\z/, message: 'Input only number' }
    validates :city, :block, :building_name, :token
  end

  validates :source_area_id, numericality: { other_than: 1, message: 'Select' }

  def save
    buy = Buy.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, source_area_id: source_area_id, city: city, block: block,
                   building_name: building_name, phone_number: phone_number, buy_id: buy.id)
  end
end
