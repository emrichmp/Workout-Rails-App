class User < ApplicationRecord
    has_many :routines
    has_many :comments
    has_many :commented_routines, through: :comments,
        source: :routine

    has_secure_password

    validates :username, uniqueness: true
    validates :username, :password, presence: true
end
