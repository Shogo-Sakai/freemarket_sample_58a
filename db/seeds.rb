# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "csv"

CSV.foreach('db/seeds/csv/all_category.csv', encoding: 'Shift_JIS:UTF-8', headers:true ) do |row|
  
  # テストユーザー
  testuser = User.create(email:"techexpert@techmaster.com", nickname:"tech-expert-58", password: "testtest58", password_confirmation:"testtest58")

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
