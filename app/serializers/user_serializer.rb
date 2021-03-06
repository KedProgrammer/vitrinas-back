# == Schema Information
#
# Table name: users
#
#  id              :bigint(8)        not null, primary key
#  name            :string
#  email           :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  type            :string
#

class UserSerializer < ActiveModel::Serializer
  attributes :type,
            :auth_token

  def auth_token
    scope[:auth_token]
  end
end
