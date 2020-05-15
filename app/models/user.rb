class User < ApplicationRecord
    has_many :skills
    has_many :favourites 
    has_secure_password :password

end
