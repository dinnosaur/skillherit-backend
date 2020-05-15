class Skill < ApplicationRecord
    belongs_to :user 
    has_many :links
    has_many :topic_skills
    has_many :topics, through: :topic_skills
   
end
