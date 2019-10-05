# == Schema Information
#
# Table name: categories
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  type       :string
#

class CategoryRowMaterial < Category
  default_scope { includes(:row_materials) }
  has_many :row_materials

end
