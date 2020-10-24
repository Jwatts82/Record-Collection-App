class Album < ActiveRecord::Base
    belongs_to :user
    validates :title, :artist, :release_year, :duration, :genre, presence: true
end