class Movie < ActiveRecord::Base
  belongs_to :director, foreign_key: :director_id, class_name: 'Person'

  has_many :videos
end
