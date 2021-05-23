require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('public/images/item-sample.png')
  end

  describe '商品出品機能' do
    context '商品出品がうまくいくとき' do

      it 'image/product_name/description/category_id/judgement_id/shipping_cost_id/shipping_area_id/shipping_days_id/price/user_idが存在すれば登録できる' do
        expect(@item).to be_valid
      end

    end

    context '商品出品がうまくいかないとき' do

      it 'imageが空だと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'product_nameが空だと登録できない' do
        @item.product_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product name can't be blank")
      end

      it 'descriptionが空だと登録できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it 'category_idが空では登録されない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank", "Category is not a number")
      end

      it 'judgement_idが空では登録されない' do
        @item.judgement_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Judgement can't be blank", "Judgement is not a number")
      end

      it 'shipping_cost_id が空では登録されない' do
        @item.shipping_cost_id  = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping cost can't be blank", "Shipping cost is not a number")
      end

      it 'shipping_area_idが空では登録されない' do
        @item.shipping_area_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping area can't be blank", "Shipping area is not a number")
      end

      it 'shipping_days_idが空では登録されない' do
        @item.shipping_days_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping days can't be blank", "Shipping days is not a number")
      end

      it 'priceが空では登録されない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it 'priceが299以下だと登録できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than 300")
      end

      it 'priceが10000000以上だと登録できない' do
        @item.price = "10000000"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than 9999999")
      end

      it 'priceが半角数字以外では登録できない' do
        @item.price = "１０００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

    end
  end
end