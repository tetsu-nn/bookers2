class Book < ApplicationRecord
  belongs_to :user

  validates :title, presence: true,length: { minimum: 1}
  validates :body, presence: true
  validates :body, length: { maximum: 200 }, allow_blank: true
end
