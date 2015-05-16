class NoteSerializer < ApplicationSerializer
  attributes :id, :content

  has_many :tags, serializer: TagSerializer
end


