require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('public/test-image.png')
  end

  describe '商品の出品' do
    context '商品の出品ができる場合' do
      it '画像、商品名、商品の説明、カテゴリ、商品の状態、配送料の負担、発送元の地域、発送までの日数、価格があれば、商品の出品ができる' do
        expect(@item).to be_valid
      end
    end

    context '商品の出品ができない場合' do
      it '画像がなければ商品の出品ができない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('画像を入力してください')
      end
      it '商品名がなければ商品の出品ができない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('商品名を入力してください')
      end
      it '商品の説明がなければ商品の出品ができない' do
        @item.description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('商品の説明を入力してください')
      end
      it 'カテゴリがなければ商品の出品ができない' do
        @item.category = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('カテゴリを入力してください')
      end
      it '商品の状態がなければ商品の出品ができない' do
        @item.condition = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('商品の状態を入力してください')
      end
      it '配送料の負担がなければ商品の出品ができない' do
        @item.delivery_fee = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('発送料を入力してください')
      end
      it '発送元の地域がなければ商品の出品ができない' do
        @item.state = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('発送元の地域を入力してください')
      end
      it '発送までの日数がなければ商品の出品ができない' do
        @item.day = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('発送までの日数を入力してください')
      end
      it '価格がなければ商品の出品ができない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('価格を入力してください')
      end

      it '価格の範囲が300円〜9999999円の範囲でなければ商品の出品ができない' do
        if @item.price = be_between(300, 9_999_999).inclusive
          @item.valid?
          expect(@item.errors.full_messages).to include('価格は不正な値です')
        end
      end

      it 'Userが紐づいていなければ商品の出品ができない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('ユーザーを入力してください')
      end
    end
  end
end
