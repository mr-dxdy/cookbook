class Unit
  class << self
    def all
      ::Ingredient.units.map { |name, id| new(id: id, name: name) }
    end

    def [](id)
      all.find { |unit| unit.id == id }
    end
  end

  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :id, :integer
  attribute :name, :string

  def local_name
    I18n.t name
  end

  def local_abbrev
    I18n.t name, scope: :abbrev
  end
end
