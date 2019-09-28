# freemarket_sample_58a

## フリマアプリのクローンサイト

### サーバー ID
http://52.69.194.87/

### ベーシック認証、テストユーザー
最終課題説明文の資料を参考ください。




## Database design
---------------

## EntityRelashionshipDiagram

[](https://ucf246fb74d41fa48f8cff7a6461.previews.dropboxusercontent.com/p/thumb/AAnf7u1q90agdrqtSmD-IRAAexR4_wSNjdnFgPJQmbQOfND6ELzGimgH3_yvun-eJNQRGtLzteJ6BE6SmxFvGZkX-yZ4mmuZ-5F5n7-rjbdACEaspCBCgNOzAw_AxQ6Xsu4KkvyYnVB9uZBSanxUjaiHqmFEWZ0jh7tS_CYxOAioEhtH92e2hJDadStvVzInyZzNZq0GN1SHyrXBbrRrP6A5MC_1UM37e4z0P6xahIMuTEIirAYMsy8YGjSHB4lE1HeXXJTkGtVlExJbOZaZLQhaMYfa-2EY3jeNaiIgsn-qdvUm1yc4_VNUdEH2RK8RJ08ExDjB41APSsZdp4iyuNx5qHm1upnJIH_tks8QlWq5mAptZ7R8qj6wgEjwRT1w5BvtrjV3AnCZ_XecH95ZVGSIoN8m7LgBJMwIPyJ6mX3UPA/p.png)

## Usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false,unique: true|
|password|string|null: false|
|encrypted_password|string|null: false|
### Association

- has_one  :profile,         dependent: :destroy
- has_one  :creditcard,      dependent: :destroy
- has_many :products,        dependent: :destroy
- has_many :buyer_trades,    dependent: :destroy, class_name: "Trade",  foreign_key: "buyer_id"
- has_many :seller_trades,   dependent: :destroy, class_name: "Trade",  foreign_key: "seller_id"


## Profilesテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|foreign_key: true|
|avatar|string||
|birthyear|integer|null: false|
|birthmonth|integer|null: false|
|birthday|integer|null: false|
|family_name|string|null: false|
|personal_name|string|null: false|
|family_name_kana|string|null: false|
|personal_name_kana|string|null: false|
|postal_code|integer|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|address|string|null: false|
|building|string||
|tel|integer||
|post_family_name|string|null: false|
|post_personal_name|string|null: false|
|post_family_name_kana|string|null: false|
|post_personal_name_kana|string|null: false|


### Association

- belongs_to :user

## Creditcardsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|foreign_key: true|
|card_id|string|null: false|
|customer_id|string|null: false|

### Association

- belongs_to :user

## Productsテーブル

|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|text|text|null: false|
|fresh_status|string|null:false|
|user_id|references|foreign_key: true|
|sell_status|string|null: false|
|price|integer|null: false|
|deliver_person|string|null: false|
|from_area|string|null: false|
|deliver_leadtime|string|null: false|
|deliver_way|string|null: false|
|brand_id|references|foreign_key: true|
|category_index_id|references|foreign_key: true|
|bigcategory_id|references|foreign_key: true|
|smallcategory_id|references|foreign_key: true|
|size_id|references|foreign_key: true|

### Association

- has_one    :trade
- has_many   :product_images, dependent: :delete_all
- belongs_to :user
- belongs_to :brand
- has_one    :category_index
- has_one    :bigcategory
- has_one    :smallcategory
- has_one    :size

## ProductImagesテーブル

|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|product_id|references|foreign_key: true|

### Association

- belongs_to :product, optional:true, dependent: :destroy,

## Sizeテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association

- belongs_to :product
- has_many   :smallcategories
- has_many   :smallcategories_has_sizes

## SmallcategoriesHasSizesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|smallcategory_id|references|null: false|
|size_id|references|null: false|

### Association

- belongs_to :size
- belongs_to :smallcategory

## CategorieIndecesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association

- has_many   :bigcategories
- belongs_to :product, optional: true

## Bigcategoriesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|category_index_id|references|null: false|

### Association

- belongs_to :category_index, optional: true
- belongs_to :product,        optional: true
- has_many   :smallcategories

## Smallcategoriesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|bigcategory_id|references|null: false|

### Association

- belongs_to :bigcategory, optional: true
- belongs_to :product,     optional: true
- has_many   :sizes
- has_many   :smallcategories_has_sizes

## Tradesテーブル

|Column|Type|Options|
|------|----|-------|
|product_id|references|foreign_key: true|
|buyer_id|references|foreign_key: { to_table: :users }, null: false|
|seller_id|references|foreign_key: { to_table: :users }, null: false|

### Association

- belongs_to :buyer,  class_name: "User", foreign_key: "buyer_id"
- belongs_to :seller, class_name: "User", foreign_key: "seller_id"
- belongs_to :product

