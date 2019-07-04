# == Schema Information
#
# Table name: product_row_materials
#
#  id              :bigint(8)        not null, primary key
#  product_id      :bigint(8)
#  row_material_id :bigint(8)
#  quantity        :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'test_helper'

class ProductRowMaterialTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
