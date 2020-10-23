class User < ActiveRecord::Base
    has_many :albums
    has_secure_password
end