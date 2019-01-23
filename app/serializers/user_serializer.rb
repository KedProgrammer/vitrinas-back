class UserSerializer < ActiveModel::Serializer
  attributes :type,
            :auth_token

  def auth_token
    scope[:auth_token]
  end
end