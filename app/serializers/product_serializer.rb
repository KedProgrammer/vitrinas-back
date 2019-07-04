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
#

class ProductSerializer < ActiveModel::Serializer
  attributes :id,
             :name,
             :code,
             :price,
             :row_material_summary

end
