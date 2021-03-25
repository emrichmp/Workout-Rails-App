class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :routine
    has_many :users, through: :routines
    validates :content, presence: true
end
