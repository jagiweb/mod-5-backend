class User < ApplicationRecord
    has_many :news
    has_many :works
    
    has_secure_password
end
