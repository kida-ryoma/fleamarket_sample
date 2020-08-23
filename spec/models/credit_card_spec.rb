require 'rails_helper'
  describe CreditCard  do
    describe '#create' do
      it "クレジットカードは登録できます"do
      credit_card = build(:credit_card)
      expect(credit_card).to be_valid
    end
      it "カード番号なしでは登録できません" do
      credit_card = build(:credit_card, customer_id: "")
      credit_card.valid?
      expect(credit_card.errors[:customer_id]).to include("を入力してください")
    end
      it "有効期限なしでは登録できません" do
      credit_card = build(:credit_card, card_id: "")
      credit_card.valid?
      expect(credit_card.errors[:card_id]).to include("を入力してください")
    end
  end
end