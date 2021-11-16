require Rails.root.join("app", 'models', 'settings')

Settings.configure do |config|
  config.vk_id = ENV['VK_API_ID']
  config.vk_secret = ENV['VK_API_SECRET']
end
