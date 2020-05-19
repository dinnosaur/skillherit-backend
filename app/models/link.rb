class Link < ApplicationRecord
    belongs_to :skill

    def self.createLinks(links,skillId)
        return links.each { |k, url| Link.create(url: url, skill_id:skillId) }
    end
end
