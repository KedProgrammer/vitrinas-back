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

class ProductRowMaterial < ApplicationRecord
  belongs_to :product
  belongs_to :row_material
  after_save :update_product_cost, :update_summary, :update_price

  private

  def update_product_cost
    product.calculate_cost
  end

  def update_summary
    product.update_summary
  end

  def update_price
    product.update_price
    product.save!
  end
end
