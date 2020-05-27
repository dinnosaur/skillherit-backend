class NoteSerializer < ActiveModel::Serializer
  attributes :id, :content, :session_id
end
