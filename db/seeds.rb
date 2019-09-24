# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "csv"

CSV.foreach('db/seeds/csv/all_category.csv', encoding: 'Shift_JIS:UTF-8', headers:true ) do |row|
  # カテゴリ、サイズ名を取得
  index         = row['index']
  bigcategory   = row['bigcategory']
  smallcategory = row['smallcategory']
  size          = row['size']
  # 要素の作成、各テーブルへ保存
  category_content = CategoryIndex.find_or_create_by(name: index)
  bigcategory_content = Bigcategory.find_or_create_by(name: bigcategory, category_index_id: category_content.id)
  smallcategory_content = Smallcategory.find_or_create_by(name: smallcategory, bigcategory_id: bigcategory_content.id )
  unless size.nil?
    size_content = Size.find_or_create_by(name: size)
    SmallcategoriesHasSize.find_or_create_by(smallcategory_id: smallcategory_content.id, size_id: size_content.id )
  end
end

# テストユーザー
testuser = User.create(email:"techexpert@techmaster.com", nickname:"tech-expert-58", password: "testtest58", password_confirmation:"testtest58")
10.times{
  user = User.create(email: Faker::Internet.email, nickname: Faker::JapaneseMedia::DragonBall.unique.character, password: "password58", password_confirmation:"password58")
}


# テスト商品
testproduct = Product.create(title:"test product", text:"test text", category_index_id: 1, fresh_status:"新品、未使用", deliver_way:"ゆうパック", deliver_person:"送料込み(出品者負担)", from_area:"三重県", deliver_leadtime:"3-4日で発送", price:"3000", user_id: 1)
testimage = ProductImage.create(image:File.open("./app/assets/images/aquos.jpeg"), product_id: 1)
20.times{
  product = Product.create(title: Faker::Device.unique.model_name, text: Faker::Quote.unique.most_interesting_man_in_the_world, category_index_id: rand(1..13), fresh_status: ProductFreshness.find(rand(1..6)).status, deliver_way:DeliverWay.find(rand(1..9)).way, deliver_person: DeliverFee.find(1).fee, from_area: Prefecture.find(rand(1..47)).name, deliver_leadtime: DeliverDay.find(rand(1..3)).days, price: rand(100000), user_id: rand(1..User.count))
  testimage = ProductImage.create(image:File.open("./app/assets/images/aquos.jpeg"), product_id: product.id)
}

50.times{
  testimage = ProductImage.create(image:File.open("./app/assets/images/aquos.jpeg"), product_id: rand(1..Product.count))
  # debugger
}

