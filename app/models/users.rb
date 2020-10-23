class Users < ActiveRecord::Base
    has_many :albums
end