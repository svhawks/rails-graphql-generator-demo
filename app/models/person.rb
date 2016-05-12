class Person < ActiveRecord::Base
  has_many :movies, foreign_key: :director_id
end
