class UserSerializer
  include JSONAPI::Serializer

  has_many :events, dependent: :destroy
  has_many :comics, dependent: :destroy

  set_key_transform :camel_lower
end
