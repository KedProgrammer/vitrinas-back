# == Schema Information
#
# Table name: products
#
#  id                   :bigint(8)        not null, primary key
#  name                 :string
#  code                 :string
#  cost                 :decimal(, )
#  category_product_id  :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  row_material_summary :string
#  profit_rate          :decimal(, )
#  price                :decimal(, )
#

class Product < ApplicationRecord
  has_many :product_row_materials, dependent: :destroy
  has_many :row_materials, through: :product_row_materials
  belongs_to :category_product
  before_update :update_price, if: Proc.new { |p| p.profit_rate_changed? }
  mount_base64_uploader :image, ImageUploader
  serialize :row_material_summary, Array

  def calculate_cost
    self.cost = product_row_materials.sum { |p| p.row_material.price * p.quantity }
    save!
  end

  def update_summary
    self.row_material_summary = product_row_materials.inject([]) { |array, f| array.push(f.row_material.attributes.merge(quantity: f.quantity, product_row_material_id: f.id)) }
    save!
  end

  def update_price
    self.price = cost * (1 + (profit_rate / 100).to_f)
  end
end
