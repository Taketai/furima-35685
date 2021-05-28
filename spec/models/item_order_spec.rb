require 'rails_helper'

RSpec.describe ItemOrder, type: :model do
  describe '商品購入機能' do

    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      sleep(1)
      @item_order = FactoryBot.build(:item_order, user_id: @user.id, item_id: @item.id)
      
    end


    context '商品購入がうまくいくとき' do

      it '全ての項目が入力されていれば購入ができる' do
        expect(@item_order).to be_valid
      end

      it 'building_nameが空でも登録できる' do
        @item_order.building_name = nil
        @item_order.valid?
        expect(@item_order.building_name).to eq nil
      end

    end

    context '商品購入がうまくいかないとき' do

      it "tokenが空では登録できないこと" do
        @item_order.token = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Token can't be blank")
      end

      it '郵便番号が空だと購入ができない' do
        @item_order.postal_code = nil
        @item_order.valid?
        expect(@item_order.errors.messages).to include({:postal_code => ["can't be blank", "is invalid" ]})
      end

      it '郵便番号に"-"がないと登録できない' do
        @item_order.postal_code = "12345678"
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Postal code is invalid")
      end

      it '郵便番号が8桁でないと購入できない' do
        @item_order.postal_code = "123-458"
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Postal code is invalid")
      end

      it 'shipping_area_idが空だと購入できない' do
        @item_order.shipping_area_id = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Shipping area can't be blank")
      end

      it 'shipping_area_idが1だと登録できない' do
        @item_order.shipping_area_id = 1
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include('Shipping area must be other than 1')
      end

      it 'city_nameが空だと購入できない' do
        @item_order.city_name = ""
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("City name can't be blank")
      end

      it 'block_nameが空だと購入できない' do
        @item_order.block_name = ""
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Block name can't be blank")
      end

      it 'phone_numberが空だと購入できない' do
        @item_order.phone_number = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Phone number can't be blank", "Phone number is invalid")
      end

      it 'phone_numberが11桁でなければ購入できない' do
        @item_order.phone_number = "080123456789"
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Phone number is invalid")
      end

      it 'phone_numberに"-"が含まれていると登録できない' do
        @item_order.phone_number = '090-1234-5678'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include('Phone number is invalid')
      end

      it 'user_idが存在しないと登録できない' do
        @item_order.user_id = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが存在しないと登録できない' do
        @item_order.item_id = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Item can't be blank")
      end

    end
  end
end
