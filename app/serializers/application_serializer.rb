class ApplicationSerializer < SimpleDelegator
  include ActiveModel::Serializers::JSON

  class << self
    def attributes(*attrs)
      define_method :attributes do
        attrs.inject({}) do |hash, attr|
          hash[attr] = nil
          hash
        end
      end
    end

    def as_json(records, options = {})
      records.respond_to?(:length) ?
        collection_as_json(records, options) : item_as_json(records, options)
    end

    def collection_as_json(records, options = {})
      records.map { |record| item_as_json(record, options) }
    end

    def item_as_json(record, options = {})
      new(record).as_json(options)
    end

    def to_json(records, options = {})
      as_json(records, options).to_json
    end
  end

  private

  def object
    __getobj__
  end
end
