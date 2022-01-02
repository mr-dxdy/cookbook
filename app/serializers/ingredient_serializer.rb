class IngredientSerializer < ApplicationSerializer
  attributes :id, :product, :unit, :number

  def product
    ProductSerializer.new(object.product).as_json
  end

  def unit
    UnitSerializer.new(object.unit_record).as_json
  end
end
