class Article < ApplicationRecord

  belongs_to :user_log
  has_many :article_categories
  has_many :categories, through: :article_categories
  validates:title, presence:true,length:{minimum:6,maximum:100}
  validates:description, presence:true,length:{minimum:6,maximum:100}


end