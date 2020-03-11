class News < ApplicationRecord
  belongs_to :user
  has_one_attached :news_image
end
