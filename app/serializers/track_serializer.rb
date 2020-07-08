class TrackSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :integer, :",post_id", :distraction, :feedback, :completed
end
