require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品が出品できる場合' do
      it 'image、name、description、category_id、product_state_id、charge_burden_id、source_area_id、delivery_day_id、priceが存在すれば出品できる' do
        expect(@item).to be_valid
      end
    end

    context '商品が出品できない場合' do
      it 'imageが空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameが空では出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'descriptionが空では出品できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'category_idが空では出品できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Category Select')
      end
      it 'product_state_idが空では出品できない' do
        @item.product_state_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Product state Select')
      end
      it 'charge_burden_idが空では出品できない' do
        @item.charge_burden_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Charge burden Select')
      end
      it 'source_area_idが空では出品できない' do
        @item.source_area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Source area Select')
      end
      it 'delivery_day_idが空では出品できない' do
        @item.delivery_day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery day Select')
      end
      it 'priceが空では出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが¥300~¥9,999,999の間でなければ出品できない(min)' do
        @item.price = '200'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Out of setting range')
      end
      it 'priceが¥300~¥9,999,999の間でなければ出品できない(max)' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Out of setting range')
      end
      it 'priceは半角数字でなければ出品できない' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Half-width number')
      end
      it 'ユーザーが紐付いていなければ出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
