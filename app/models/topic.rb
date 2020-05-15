class Topic < ApplicationRecord
    has_many :topic_skills
    has_many :users, through: :topic_skills
end
