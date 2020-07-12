# == Schema Information
#
# Table name: employees
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  age        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Employee < ApplicationRecord
  has_many :loans
end
