class User < ApplicationRecord

    validates :username, uniqueness: true 

    has_many :comments
    has_many :posts, through: :comments
end
