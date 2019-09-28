# TECH::EXPERT福岡校58期短期集中就職コース最終課題

フリマアプリのクローンサイトを3人で作成しました。

ユーザーの新規登録から商品の出品及び購入ができます。

We made web application site of freemarket App by 3 members.

You can make or signin with your account.

Sell something you want, buy something you need.

## 説明:Description

・ユーザー登録機能としてSNS及びSMS認証等を行い、クレジットカードを登録できます。

・商品出品機能として画像や商品カテゴリを含めた複数項目の情報をDBへ登録することができます。

・商品購入機能としてユーザーが所持するクレジットカードを用いて商品の購入ができます。

・You can make an acount by using SNS, SMS authentication system and you can register a credit card.

・You can sell an item with images, item categories, and other column informations.

・You can buy an item you want by using your credit card you registered.

## 競合作品との比較:VS.

他スクール生の作品と比較しショートメールによる認証機能の実装や、ナビゲーションバーのパンくず機能再現など、細かい見た目の再現度が高いです。

Our website can use short mail authentication system, and other detail's are looks just like "REAL APP" than other TECH::EXPERT school students.

## 開発環境:Development environment

<dl>

<dt>Server ID</dt>

<dd> http://52.69.194.87/ </dd>

<dt>Basic Authentification and test users</dt>

<dd>最終課題説明文の資料を参考ください。</dd>

<dd>Please refer to our description document.</dd>

<dt>Development environment</dt>

<dd>Ruby 2.5.1</dd>

<dd>Ruby on Rails 5.2.3</dd>

<dd>mysql2</dd>

<dd>Haml 5.1.2</dd>

<dd>Ruby Sass 3.7.4</dd>

<dd>jquery-rails 4.3.5</dd>

<dd>AWS EC2</dd>

<dd>S3</dd>

</dl>

## データベース設計:Database design

---------------

## ERD図:EntityRelashionshipDiagram

画像を貼る。

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
