class EventSerializer
  include JSONAPI::Serializer

  belongs_to :user

  set_key_transform :camel_lower
end
