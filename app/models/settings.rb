class Settings
  class << self
    attr_accessor :vk_id, :vk_secret, :guest_email

    def configure
      yield(self)
    end
  end
end
