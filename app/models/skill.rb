class Skill < ApplicationRecord
    belongs_to :user 
    has_many :links
    has_many :topic_skills
    has_many :topics, through: :topic_skills
   

    def self.calculateMonths(duration) 
        totalMonths = 0 
        yearsToMonths = Integer(duration["years"]) * 12
        totalMonths = yearsToMonths + Integer(duration["months"])
        return totalMonths
    end
end
