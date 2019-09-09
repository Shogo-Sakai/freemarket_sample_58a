# freemarket_sample_58a

Database design
---------------

## Usersテーブル

|Column|Type|Options|
|------|----|-------|
|email|string|null: false,unique: true|
|password|string|null: false|

### Association

- has_one :profile, dependent: :destroy
- has_one :creditcard, dependent: :destroy
- has_many :products, dependent: :destroy
- has_many :favorites, dependent: :destroy
- has_many :infomations, dependent: :destroy
- has_many :comments, dependent: :destroy
- has_many :buyer_trades,class_name: "Trade", foreign_key: "buyer_id", dependent: :destroy
- has_many :seller_trades,class_name: "Trade", foreign_key: "seller_id", dependent: :destroy
- has_many :sender_ratings,class_name: "Rating", foreign_key: "sender_id", dependent: :destroy
- has_many :receiver_ratings,class_name: "Rating", foreign_key: "receiver_id", dependent: :destroy


## Profilesテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|user_id|references|foreign_key: true|
|avatar|string||
|birthday|string|null: false|
|family_name|string|null: false|
|prersonal_name|string|null: false|
|family_name_kana|string|null: false|
|personal_name_kana|string|null: false|
|postal_code|integer|null: false|
|city|string|null: false|
|adress|string|null: false|
|building|string||
|tel|integer||
|prefecture_id|references|foreign_key: true|

### Association

- belongs_to :user
- belongs_to :pref

## Creditcardsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|foreign_key: true|
|card_token|string|null: false|

### Association

- belongs_to :user

## Prefecturesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association

- has_many :profile
- has_many :products

## Infomationsテーブル

|Column|Type|Options|
|------|----|-------|
|body|string|null: false|
|user_id|references|foreingn_key: true|

### Association

- belongs_to :user

## Productsテーブル

|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|body|text|null: false|
|user_id|references|foreign_key: true|
|state_id|references|foreign_key: true|
|prefecture_id|references|foreign_key: true|
|brand_id|references|foreign_key: true|
|size_id|references|foreign_key: true|
|category_id|references|foreign_key: true|

### Association

- has_many :comments, dependent: :destroy
- has_many :favorites, dependent: :destroy
- has_many :tradings, dependent: :destroy
- has_many :images, dependent: :destroy
- has_one :product_option, dependent: :destroy
- belongs_to :prefecture
- belongs_to :user
- belongs_to :state
- belongs_to :category
- belongs_to :size
- belongs_to :brand

## Imagesテーブル

|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|product_id|references|foreign_key: true|

### Association

- belongs_to :product

## Statesテーブル

|Column|Type|Options|
|------|----|-------|
|body|string|null: false|

### Association

- has_many :products

## Sizeテーブル

|Column|Type|Options|
|------|----|-------|
|body|string|null: false|
|category_id|references|foreign_key: true|

### Association

- has_many :products
- belongs_to :category

## Categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|parent_id|references||
|grandparent_id|references||

### Association

- has_many :children ,class_name: "Category",foreign_key: "parent_id"
- belongs_to :parent ,class_name: "Category",optional: true
- has_many :parents ,class_name: "Category" ,foreign_key: "grandparent_id"
- belongs_to :grandparent ,class_name: "Category",optional: true
- has_many :size
- has_many :products

## Brandテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|brand_group_id|references|foreign_key: true|

### Association

- has_many :products
- belongs_to :brand_group

## Brand_groupテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association

- has_many :brands

## Product_optionsテーブル

|Column|Type|Options|
|------|----|-------|
|product_id|references|foreign_key: true|
|condition_id|references|foreign_key: true|
|delivery_day_id|references|foreign_key: true|
|delivery_method_id|references|foreign_key: true|
|delivery_fee_id|references|foreign_key: true|


### Association

- belongs_to :product
- belongs_to :condition
- belongs_to :delivery_day
- belongs_to :delivery_method
- belongs_to :delivery_fee

## Conditionsテーブル

|Column|Type|Options|
|------|----|-------|
|body|string|null: false|

### Association

- has_many :product_options

## Delivery_daysテーブル

|Column|Type|Options|
|------|----|-------|
|body|string|null: false|

### Association

- has_many :product_options

## Delivery_methodsテーブル

|Column|Type|Options|
|------|----|-------|
|body|string|null: false|

### Association

- has_many :product_options

## Delivery_feesテーブル

|Column|Type|Options|
|------|----|-------|
|body|string|null: false|

### Association

- has_many :product_options

## Tradesテーブル

|Column|Type|Options|
|------|----|-------|
|buyer_id|references|foreign_key: { to_table: :users }, null: false|
|seller_id|references|foreign_key: { to_table: :users }, null: false|
|product_id|references|foreign_key: true|

### Association

- belongs_to :buyer, class_name: "User", foreign_key: "buyer_id"
- belongs_to :seller, class_name: "User", foreign_key: "seller_id"
- belongs_to :product

## Ratingsテーブル

|Column|Type|Options|
|------|----|-------|
|rate|integer|null: false|
|body|text|null: false|
|sender_id|references|foreign_key: { to_table: :users }, null: false|
|receiver_id|references|foreign_key: { to_table: :users }, null: false|

### Association

- belongs_to :sender, class_name: "User", foreign_key: "sender_id"
- belongs_to :receiver, class_name: "User", foreign_key: "receiver_id"