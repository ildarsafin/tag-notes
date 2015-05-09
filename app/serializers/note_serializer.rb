class NoteSerializer < ApplicationSerializer
  attributes :id, :content, :tag_ids

  has_many :tags, serializer: TagSerializer
end


