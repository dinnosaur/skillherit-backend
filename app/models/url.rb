class Url < ApplicationRecord
    belongs_to :session

    def self.createLinks(links,sessionId)
        return links.each { |k, url| Url.create(link: url, session_id:sessionId) }
    end
end
