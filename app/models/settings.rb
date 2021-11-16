class Settings
  class << self
    attr_accessor :vk_id, :vk_secret

    def configure
      yield(self)
    end
  end
end
