class Task < ApplicationRecord
  validates :content, presence: true, length: {minimum: 5, maximum: 200}
  belongs_to :user
end
