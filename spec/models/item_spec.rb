require 'rails_helper'
describe Item  do
  describe '#create' do
    it "is valid with a name, price, description, sales_status, size, brand,category_id,prefecture_code, status_id, user_id, delivery_responsibility_id, preparation_day_id" do
      category = create(:category)
      status = create(:status)
      delivery_responsibility = create(:delivery_responsibility)
      user = create(:user)
      preparation_day = create(:preparation_day)
      item = build(:item, category_id: category[:id], status_id: status[:id], user_id: user[:id], delivery_responsibility_id: delivery_responsibility[:id], preparation_day_id: preparation_day[:id] )
      expect(item).to be_valid
    end
    it "is invalid without a name" do
      category = create(:category)
      status = create(:status)
      delivery_responsibility = create(:delivery_responsibility)
      user = create(:user)
      preparation_day = create(:preparation_day)
      item = build(:item, name: "", category_id: category[:id], status_id: status[:id], user_id: user[:id], delivery_responsibility_id: delivery_responsibility[:id], preparation_day_id: preparation_day[:id] )
      item.valid?
      expect(item.errors[:name]).to include("can't be blank")
    end
    it "is invalid without a description" do
      category = create(:category)
      status = create(:status)
      delivery_responsibility = create(:delivery_responsibility)
      user = create(:user)
      preparation_day = create(:preparation_day)
      item = build(:item, description: "", category_id: category[:id], status_id: status[:id], user_id: user[:id], delivery_responsibility_id: delivery_responsibility[:id], preparation_day_id: preparation_day[:id] )
      item.valid?
      expect(item.errors[:description]).to include("can't be blank")
    end
    it "is invalid without a price" do
      category = create(:category)
      status = create(:status)
      delivery_responsibility = create(:delivery_responsibility)
      user = create(:user)
      preparation_day = create(:preparation_day)
      item = build(:item, price: "", category_id: category[:id], status_id: status[:id], user_id: user[:id], delivery_responsibility_id: delivery_responsibility[:id], preparation_day_id: preparation_day[:id] )
      item.valid?
      expect(item.errors[:price]).to include("can't be blank")
    end
    it "is invalid without a status_id" do
      category = create(:category)
      status = create(:status)
      delivery_responsibility = create(:delivery_responsibility)
      user = create(:user)
      preparation_day = create(:preparation_day)
      item = build(:item, status_id: nil,  category_id: category[:id], user_id: user[:id], delivery_responsibility_id: delivery_responsibility[:id], preparation_day_id: preparation_day[:id] )
      item.valid?
      expect(item.errors.full_messages).to include("Status must exist")
    end
    it "is invalid without a category_id" do
      category = create(:category)
      status = create(:status)
      delivery_responsibility = create(:delivery_responsibility)
      user = create(:user)
      preparation_day = create(:preparation_day)
      item = build(:item, category_id: nil,  status_id: status[:id], user_id: user[:id], delivery_responsibility_id: delivery_responsibility[:id], preparation_day_id: preparation_day[:id] )
      item.valid?
      expect(item.errors.full_messages).to include("Category must exist")
    end
    it "is invalid without a user_id" do
      category = create(:category)
      status = create(:status)
      delivery_responsibility = create(:delivery_responsibility)
      user = create(:user)
      preparation_day = create(:preparation_day)
      item = build(:item, user_id: nil,  category_id: category[:id], status_id: status[:id], delivery_responsibility_id: delivery_responsibility[:id], preparation_day_id: preparation_day[:id] )
      item.valid?
      expect(item.errors.full_messages).to include("User must exist")
    end
    it "is invalid without a delivery_responsibility_id" do
      category = create(:category)
      status = create(:status)
      delivery_responsibility = create(:delivery_responsibility)
      user = create(:user)
      preparation_day = create(:preparation_day)
      item = build(:item, delivery_responsibility_id: nil,  category_id: category[:id], user_id: user[:id], status_id: status[:id], preparation_day_id: preparation_day[:id] )
      item.valid?
      expect(item.errors.full_messages).to include("Delivery responsibility must exist")
    end
    it "is invalid without a preparation_day_id" do
      category = create(:category)
      status = create(:status)
      delivery_responsibility = create(:delivery_responsibility)
      user = create(:user)
      preparation_day = create(:preparation_day)
      item = build(:item, preparation_day_id: nil,  category_id: category[:id], user_id: user[:id], delivery_responsibility_id: delivery_responsibility[:id], status_id: status[:id] )
      item.valid?
      expect(item.errors.full_messages).to include("Preparation day must exist")
    end
  end
end