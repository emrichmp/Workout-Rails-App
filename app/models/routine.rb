class Routine < ApplicationRecord
    belongs_to :user
    has_many :comments
    has_many :users, through: :comments

    validates :day, presence: true
    #limits the amount of routine instances a user can make a day
    validate :limit_routines
    
    #scope method
    scope :alpha, -> { order(:day) }

    def limit_routines
        today_comments = user.comments.select do |i|
            i.created_at.to_date == Date.today
        end
        if today_comments.size > 2
            errors.add(:routine_id, "- Can't create more than 3 routines per day")
        end
    end
end
