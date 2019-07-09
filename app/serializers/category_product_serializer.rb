class CategoryProductSerializer < ActiveModel::Serializer
  attributes :id,
             :name

  has_many :products
end
