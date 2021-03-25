class Routine < ApplicationRecord
    belongs_to :user
    has_many :comments
    has_many :users, through: :comments
    validates :day, presence: true
    
    #scope method
    scope :alpha, -> { order(:day) }
end
