class Topic < ActiveRecord::Base
  has_many :posts, dependent: :destroy
  validates :name, length:{ minimum: 5 }, presence: true
  validates :description, length:{ minimum: 15 }, presence: true
  validates :public, presence: true

  has_many :sponsoredposts, dependent: :destroy

  

end
