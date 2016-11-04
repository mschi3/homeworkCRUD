class Movie < ActiveRecord::Base
	validates :title, presence: true, length: {minimum: 3, maximum: 50}
  validates :description, presence: true, length: {minimum: 10, maximum: 300}
  validates :rating, presence: true, length: {minimum: 0, maximum: 5}
end

