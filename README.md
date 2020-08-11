# README

## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|description|text|null: false|
|price|integer|null: false|
|size|string|
|brand|string|
|sales_status|integer|null: false|
|category_id|references|foreign_key: true|
|status_id|references|foreign_key: true|
|area_id|references|foreign_key: true|
|order_id|references|foreign_key: true|
|user_id|references|foreign_key: true|


### Association
- belongs_to :category
- belongs_to :status
- belongs_to :user
- has_one :area, dependent: :destroy
- has_one :preparation_day, dependent: :destroy
- has_one :order, dependent: :destroy
- has_many :item_images, dependent: :destroy


## categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string|null: false|

### Association
- has_many :items


## item_imagesテーブル

|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|item_id|references|foreign_key: true|

### Association
- belongs_to :item

## statusesテーブル

|Column|Type|Options|
|------|----|-------|
|status|string|null: false|

### Association
- has_many :items


## areasテーブル

|Column|Type|Options|
|------|----|-------|
|prefecture_id|integer|null: false|

### Association
- belongs_to :item

## preparation_daysテーブル

|Column|Type|Options|
|------|----|-------|
|preparation_days|string|null: false|
|item_id|references|foreign_key: true|

### Association
- belongs_to :item

## ordersテーブル

|Column|Type|Options|
|------|----|-------|
|item_id|references|foreign_key: true|
|seller_id|references|foreign_key: { to_table: users }, null: false|
|buyer_id|references|foreign_key: { to_table: users }, null: false|

### Association
- belongs_to :item
- belongs_to :seller, class_name: 'User', foreign_key: 'seller_id'
- belongs_to :buyer, class_name: 'User', foreign_key: 'buyer_id'



## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nick_name|string|null: false|
|email|string|null: false|
|image|string|
|password|string|null: false|
|password_confirmation|string|null: false|

### Association
- has_one :profile
- has_one :delivery_destination
- has_one :credit_card
- has_many :orders
- has_many :sns_credentials
- has_many :items
- has_many :seller_orders, class_name: 'Order', foreign_key: 'seller_id'
- has_many :buyer_orders, class_name: 'Order', foreign_key: 'buyer_id'

## profilesテーブル

|Column|Type|Options|
|------|----|-------|
|family_name|string|null: false|
|first_name|string|null: false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|birthday|date|null: false|
|introduction|text|
|user_id|references|foreign_key: true|

### Association
- belongs_to :user


## delivery_destinationsテーブル

|Column|Type|Options|
|------|----|-------|
|delivery_family_name|string|null: false|
|delivery_first_name|string|null: false|
|delivery_family_name_kana|string|null: false|
|delivery_first_name_kana|string|null: false|
|phone_number|integer|
|post_code|integer|null: false|
|prefecture|integer|null: false|
|city|integer|null: false|
|house_number|string|null: false|
|building_name|string|
|user_id|references|foreign_key: true|

### Association
- belongs_to :user


## credit_cardsテーブル

|Column|Type|Options|
|------|----|-------|
|customer_id|integer|null: false|
|card_id|integer|null: false|
|user_id|references|foreign_key: true|

### Association
- belongs_to :user


## sns_credentialsテーブル

|Column|Type|Options|
|------|----|-------|
|provider|string|
|uid|string|
|user_id|references|foreign_key: true|

### Association
- belongs_to :user