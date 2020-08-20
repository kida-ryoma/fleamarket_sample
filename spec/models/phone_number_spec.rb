require 'rails_helper'
  describe PhoneNumber  do
    describe '#create' do
      it "電話番号登録できます"do
        phone_number = build(:phone_number)
        expect(phone_number).to be_valid
      end
      it "電話番号なしでは登録できません" do
        phone_number = build(:phone_number, number: "")
        phone_number.valid?
        expect(phone_number.errors[:number]).to include("を入力してください", "をハイフンなしの11桁で入力してください。")
      end
      it "電話番号はハイフンなしの１１桁であれば登録できます" do
        phone_number = build(:phone_number, number: "00000000000")
        expect(phone_number).to be_valid
      end
      it "電話番号はハイフンなしの１１桁でないと登録できません" do
        phone_number = build(:phone_number, number: "0000000000")
        phone_number.valid?
        expect(phone_number.errors[:number]).to include("をハイフンなしの11桁で入力してください。")
      end
    end
  end