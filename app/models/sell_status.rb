class SellStatus < ActiveHash::Base
  include ActiveHash::Associations

  self.data = [
    {id:1, way:"出品中"},
    {id:2, way:"交渉中"},
    {id:3, way:"出品停止中"}
  ]

end