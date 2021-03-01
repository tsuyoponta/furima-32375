require 'rails_helper'

RSpec.describe BuyAddress, type: :model do
  before do
    @buy_address = FactoryBot.build(:buy_address)
  end
  
  describe '商品購入機能' do
    context '商品が購入できる場合' do
      it 'すべての値が正しく入力されていれば保存できる' do
        expect(@buy_address).to be_valid
      end
    end

    context '商品が購入できない場合' do
      it 'postal_codeが空だと保存できない' do
        @buy_address.postal_code = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeにハイフンがないと保存できない' do
        @buy_address.postal_code = 1234567
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it 'source_areaが空では保存できない' do
        @buy_address.source_area_id = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Source area Select")
      end
      it 'cityが空では保存できない' do
        @buy_address.city = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("City can't be blank")
      end
      it 'blockが空では保存できない' do
        @buy_address.block = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Block can't be blank")
      end
      it 'building_nameが空では保存できない' do
        @buy_address.building_name = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Building name can't be blank")
      end
      it 'phone_numberが空では保存できない' do
        @buy_address.phone_number = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberにハイフンがあると保存できない' do
        @buy_address.phone_number = '090-1234-5678'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Phone number Input only number")
      end
      it 'phone_numberが12桁以上だと保存できない' do
        @buy_address.phone_number = '090123456789'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Phone number Input only number")
      end
    end
  end
end