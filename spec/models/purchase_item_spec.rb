require 'rails_helper'

RSpec.describe PurchaseItem, type: :model do
  before do
    @purchase_item = FactoryBot.build(:purchase_item)
    @item = FactoryBot.build(:item)
  end

  describe '商品の購入' do
    context '商品の購入ができる場合' do
      it 'すべての値が正しく入力されていれば保存できる' do
        expect(@purchase_item).to be_valid
      end
    end

    context '商品の購入ができない場合' do
      it '正しいクレジットカード情報’がなければ商品の購入ができない' do
        @purchase_item.token = nil
        @purchase_item.valid?
        expect(@purchase_item.errors.full_messages).to include('Tokenカード情報を正しく入力してください')
      end

      it '郵便番号がなければ商品の購入ができない' do
        @purchase_item.postal_code = nil
        @purchase_item.valid?
        expect(@purchase_item.errors.full_messages).to include('郵便番号を入力してください')
      end

      it '郵便番号にハイフンがなければ商品の購入ができない' do
        @purchase_item.postal_code = 1_234_567
        @purchase_item.valid?
        expect(@purchase_item.errors.full_messages).to include('郵便番号は不正な値です')
      end

      it '都道府県がなければ商品の購入ができない' do
        @purchase_item.state_id = nil
        @purchase_item.valid?
        expect(@purchase_item.errors.full_messages).to include('都道府県を入力してください')
      end

      it '都道府県で--を選択すると商品の購入ができない' do
        @purchase_item.state_id = 1
        @purchase_item.valid?
        expect(@purchase_item.errors.full_messages).to include('都道府県は1以外の値にしてください')
      end

      it '市区町村がなければ商品の購入ができない' do
        @purchase_item.city = nil
        @purchase_item.valid?
        expect(@purchase_item.errors.full_messages).to include('市区町村を入力してください')
      end

      it '番地がなければ商品の購入ができない' do
        @purchase_item.address_line = nil
        @purchase_item.valid?
        expect(@purchase_item.errors.full_messages).to include('番地を入力してください')
      end

      it '電話番号がなければ商品の購入ができない' do
        @purchase_item.phone_number = nil
        @purchase_item.valid?
        expect(@purchase_item.errors.full_messages).to include('電話番号を入力してください')
      end

      it '電話番号にハイフンがあれば商品の購入ができない' do
        @purchase_item.phone_number = 520 - 0o013
        @purchase_item.valid?
        expect(@purchase_item.errors.full_messages).to include('電話番号は不正な値です')
      end

      it '電話番号が11桁以内でなければ商品の購入ができない' do
        @purchase_item.phone_number = '0900000000'
        @purchase_item.valid?
        expect(@purchase_item.errors.full_messages).to include('電話番号は不正な値です')
      end
    end
  end
end
