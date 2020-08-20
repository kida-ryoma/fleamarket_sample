require 'rails_helper'
  describe User  do
    describe '#create' do
      it "問題ありません"do
        user = build(:user)
        expect(user).to be_valid
      end
      it "ニックネームなしでは登録できません" do
        user = build(:user, nick_name: "")
        user.valid?
        expect(user.errors[:nick_name]).to include("を入力してください")
      end
      it "アドレスなしでは登録できません" do
        user = build(:user, email:"")
        user.valid?
        expect(user.errors[:email]).to include("を入力してください")
      end
      it "パスワードなしでは登録できません" do
        user = build(:user, password: "")
        user.valid?
        expect(user.errors[:password]).to include("を入力してください")
      end
      it "パスワードが存在してもパスワード(確認）が空では登録できません" do
        user = build(:user, password_confirmation: "")
        user.valid?
        expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
      end
      it "苗字なしでは登録できません" do
        user = build(:user, family_name:"")
        user.valid?
        expect(user.errors[:family_name]).to include("を入力してください", "は全角で入力して下さい。")
      end
      it "苗字（カナ）なしでは登録できません" do
        user = build(:user, family_name_kana:"")
        user.valid?
        expect(user.errors[:family_name_kana]).to include("を入力してください", "はカタカナで入力して下さい。")
      end
      it "名前なしでは登録できません" do
        user = build(:user, first_name:"")
        user.valid?
        expect(user.errors[:first_name]).to include("を入力してください","は全角で入力して下さい。")
      end
      it "名前（カナ）なしでは登録できません" do
        user = build(:user, first_name_kana:"")
        user.valid?
        expect(user.errors[:first_name_kana]).to include("を入力してください", "はカタカナで入力して下さい。")
      end
      it "誕生日なしでは登録できません" do
        user = build(:user, birthday:"")
        user.valid?
        expect(user.errors[:birthday]).to include("を入力してください")
      end
    it "同じアドレスは登録できません" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("はすでに存在します")
    end
    it "パスワードが６文字以上であれば登録できます" do
      user = build(:user, password: "000000", password_confirmation: "000000")
      expect(user).to be_valid
    end
    it "パスワードが5文字以下であれば登録できません" do
      user = build(:user, password: "00000", password_confirmation: "00000")
      user.valid?
      expect(user.errors[:password]).to include("は6文字以上で入力してください")
    end
    it "苗字は全角であれば登録できます" do
      user = build(:user, family_name:"新垣")
      expect(user).to be_valid
    end
    it "苗字は全角でないと登録できません" do
      user = build(:user, family_name:"ｱﾗｶﾞｷ")
      user.valid?
      expect(user.errors[:family_name]).to include("は全角で入力して下さい。")
    end
    it "名前は全角であれば登録できます" do
      user = build(:user, first_name:"結衣")
      expect(user).to be_valid
    end
    it "名前は全角でないと登録できません" do
      user = build(:user, first_name:"ﾕｲ")
      user.valid?
      expect(user.errors[:first_name]).to include("は全角で入力して下さい。")
    end
    it "苗字(カナ）はカタカナであれば登録できます" do
      user = build(:user, family_name_kana:"アラガキ")
      expect(user).to be_valid
    end
    it "苗字(カナ）はカタカナでないと登録できません" do
      user = build(:user, family_name_kana:"あらがき")
      user.valid?
      expect(user.errors[:family_name_kana]).to include("はカタカナで入力して下さい。")
    end
    it "名前(カナ）はカタカナであれば登録できます" do
      user = build(:user, first_name_kana:"ユイ")
      expect(user).to be_valid
    end
    it "名前(カナ）はカタカナでないと登録できません" do
      user = build(:user, first_name_kana:"ゆい")
      user.valid?
      expect(user.errors[:first_name_kana]).to include("はカタカナで入力して下さい。")
    end
  end
end