class Event < ApplicationRecord
  belongs_to :user
  belongs_to :comic

  has_one_attached :image
end
