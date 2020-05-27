class SessionSerializer < ActiveModel::Serializer
  attributes :id, :track_id, :time, :distraction
end
