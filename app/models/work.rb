class Work < ApplicationRecord
  belongs_to :user
  has_one_attached :work_image
end
