class User < ActiveRecord::Base
    has_many :animals
    has_secure_password #active record gives us methods.
    validates :username, uniqueness: true
end
