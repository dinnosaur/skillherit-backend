class Session < ApplicationRecord
    belongs_to :track
    has_many :urls
    has_many :notes
end
