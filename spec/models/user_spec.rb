require 'rails_helper'
  describe User  do
    describe '#create' do
      it "is valid with a nick_name, email, family_name, first_name, family_name_kana, first_name_kana, birthday, password, password_confirmation, introduction "do
        user = build(:user)
        expect(user).to be_valid
      end
      it "is invalid without a nick_name" do
        user = build(:user, nick_name:" ")
        user.valid?
        expect(user.errors[:nickname]).to include("can't be blank")
      end
      it "is invalid without a nick_name" do
        user = build(:user, nick_name:" ")
        user.valid?
        expect(user.errors[:nickname]).to include("can't be blank")
      end
      it "is invalid without a nick_name" do
        user = build(:user, nick_name:" ")
        user.valid?
        expect(user.errors[:nickname]).to include("can't be blank")
      end
    end
  end