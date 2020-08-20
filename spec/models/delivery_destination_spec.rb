require 'rails_helper'
  describe DeliveryDestination  do
    describe '#create' do
      it "お届け先住所登録できます"do
      delivery_destination = build(:delivery_destination)
      expect(delivery_destination).to be_valid
      end
      it "お届け先の苗字がないと登録できません" do
        delivery_destination = build(:delivery_destination, delivery_family_name: "")
        delivery_destination.valid?
        expect(delivery_destination.errors[:delivery_family_name]).to include("を入力してください")
      end
      it "お届け先の名前がないと登録できません" do
        delivery_destination = build(:delivery_destination, delivery_first_name: "")
        delivery_destination.valid?
        expect(delivery_destination.errors[:delivery_first_name]).to include("を入力してください")
      end
      it "お届け先の苗字（カナ）がないと登録できません" do
        delivery_destination = build(:delivery_destination, delivery_family_name_kana: "")
        delivery_destination.valid?
        expect(delivery_destination.errors[:delivery_family_name_kana]).to include("を入力してください")
      end
      it "お届け先の名前（カナ）がないと登録できません" do
        delivery_destination = build(:delivery_destination, delivery_first_name_kana: "")
        delivery_destination.valid?
        expect(delivery_destination.errors[:delivery_first_name_kana]).to include("を入力してください")
      end
      it "お届け先の郵便番号がないと登録できません" do
        delivery_destination = build(:delivery_destination, post_code: "")
        delivery_destination.valid?
        expect(delivery_destination.errors[:post_code]).to include("を入力してください")
      end
      it "お届け先の都道府県がないと登録できません" do
        delivery_destination = build(:delivery_destination, prefecture_code: "")
        delivery_destination.valid?
        expect(delivery_destination.errors[:prefecture_code]).to include("を入力してください")
      end
      it "お届け先の市区町村がないと登録できません" do
        delivery_destination = build(:delivery_destination, city: "")
        delivery_destination.valid?
        expect(delivery_destination.errors[:city]).to include("を入力してください")
      end
      it "お届け先の番地がないと登録できません" do
        delivery_destination = build(:delivery_destination, house_number: "")
        delivery_destination.valid?
        expect(delivery_destination.errors[:house_number]).to include("を入力してください")
      end
      it "お届け先の苗字は全角であれば登録できます" do
        delivery_destination = build(:delivery_destination, delivery_first_name:"星野")
        expect(delivery_destination).to be_valid
      end
      it "お届け先の苗字は全角でないと登録できません" do
        delivery_destination = build(:delivery_destination, delivery_family_name:"ｱﾗｶﾞｷ")
        delivery_destination.valid?
        expect(delivery_destination.errors[:delivery_family_name]).to include("は全角で入力して下さい。")
      end
      it "お届け先の名前は全角であれば登録できます" do
        delivery_destination = build(:delivery_destination, delivery_first_name:"結衣")
        expect(delivery_destination).to be_valid
      end
      it "お届け先の名前は全角でないと登録できません" do
        delivery_destination = build(:delivery_destination, delivery_first_name:"ﾕｲ")
        delivery_destination.valid?
        expect(delivery_destination.errors[:delivery_first_name]).to include("は全角で入力して下さい。")
      end
      it "お届け先の苗字(カナ）はカタカナであれば登録できます" do
        delivery_destination = build(:delivery_destination, delivery_family_name_kana:"アラガキ")
        expect(delivery_destination).to be_valid
      end
      it "お届け先の苗字(カナ）はカタカナでないと登録できません" do
        delivery_destination = build(:delivery_destination, delivery_family_name_kana:"あらがき")
        delivery_destination.valid?
        expect(delivery_destination.errors[:delivery_family_name_kana]).to include("はカタカナで入力して下さい。")
      end
      it "お届け先の名前(カナ）はカタカナであれば登録できます" do
        delivery_destination = build(:delivery_destination,delivery_first_name_kana:"ユイ")
        expect(delivery_destination).to be_valid
      end
      it "お届け先の名前(カナ）はカタカナでないと登録できません" do
        delivery_destination = build(:delivery_destination, delivery_first_name_kana:"ゆい")
        delivery_destination.valid?
        expect(delivery_destination.errors[:delivery_first_name_kana]).to include("はカタカナで入力して下さい。")
      end
    end
  end