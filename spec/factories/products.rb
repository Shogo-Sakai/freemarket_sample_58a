FactoryBot.define do
  factory :product do
    title      {"単体テスト"}
    price      {"400"}
    image      {"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSVsWF8d98YVYq21f9bRkgwCUrw7nlKXmXVriBWyLZDL3OEXtzE5A"}
    created_at { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
  end

end