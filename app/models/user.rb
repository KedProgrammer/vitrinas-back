class User < ApplicationRecord
 has_secure_password
 validates :email, :name, prsence: true
end
