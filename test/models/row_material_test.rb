# == Schema Information
#
# Table name: row_materials
#
#  id                       :bigint(8)        not null, primary key
#  name                     :string
#  code                     :string
#  price                    :decimal(, )
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#  category_row_material_id :integer
#  unity                    :string
#

require 'test_helper'

class RowMaterialTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
