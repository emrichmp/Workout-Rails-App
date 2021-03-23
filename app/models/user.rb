class User < ApplicationRecord
    has_many :routines
    has_many :comments
    has_many :commented_routines, through: :comments,
        source: :routine

    has_secure_password

    validates :username, presence: true
    validates :username, uniqueness: true
end
