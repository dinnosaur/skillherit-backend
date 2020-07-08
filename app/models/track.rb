class Track < ApplicationRecord
has_many :sessions
belongs_to :user
belongs_to :skill
end
