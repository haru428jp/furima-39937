require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @order_address = FactoryBot.build(:order_address)
  end

  describe '配送先の保存' do
    context '配送先を保存できる場合' do
      it 'user_id、item_id、zip_code、prefecture_id、city、block、building、phone_numberが存在すれば保存できる' do
        expect(@order_address).to be_valid
      end
      it 'buildingが空でも保存できる' do
        @order_address.building = nil
        expect(@order_address).to be_valid
      end
    end

    context '配送先を保存できない場合' do
      it 'user_idが空だと保存できない' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空だと保存できない' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
      it 'zip_codeが空だと保存できない' do
        @order_address.zip_code = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Zip code can't be blank")
      end
      it 'zip_codeが「3桁ハイフン4桁」でないと保存できない' do
        @order_address.zip_code = '1234-567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Zip code is invalid. Enter it as follows (e.g. 123-4567)")
      end
      it 'zip_codeに半角数字とハイフン以外が含まれると保存できない' do
        @order_address.zip_code = '１２３ー４５６７'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Zip code is invalid. Enter it as follows (e.g. 123-4567)")
      end
      it 'prefecture_idの値が1では保存できない' do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空だと保存できない' do
        @order_address.city = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it 'blockが空だと保存できない' do
        @order_address.block = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Block can't be blank") 
      end
      it 'phone_numberが空だと保存できない' do
        @order_address.phone_number = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが9桁以下では保存できない' do
        @order_address.phone_number = '123456789'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid. Input only half-width number")
      end
      it 'phone_numberが12桁以上では保存できない' do
        @order_address.phone_number = '123456789012'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid. Input only half-width number")
      end
      it 'phone_numberに半角数字以外が含まれると保存できない' do
        @order_address.phone_number = '０3-1234-5678'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid. Input only half-width number")
      end
    end
  end
end
