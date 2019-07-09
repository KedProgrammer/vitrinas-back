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

class RowMaterial < ApplicationRecord
  belongs_to :category_row_material
  has_many :product_row_materials
  has_many :products, through: :product_row_materials
  after_update :update_product_cost, :update_summary, :update_price

  private

  def update_product_cost
    products.each(&:calculate_cost)
  end

  def update_summary
    products.each(&:update_summary)
  end

  def update_price
    products.each do |product|
      product.update_price
      product.save!
    end
  end
end
