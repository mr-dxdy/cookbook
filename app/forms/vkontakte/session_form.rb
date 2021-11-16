# Algorithm https://vk.com/dev/authcode_flow_user
class Vkontakte::SessionForm < BaseForm
  attribute :client_id, :string, default: Settings.vk_id
  attribute :client_secret, :string, default: Settings.vk_secret
  attribute :scope, :string, default: :email
  attribute :version, :float, default: 5.131
  attribute :code, :string

  attr_accessor :redirect_url

  def new_access_code_url
    build_oauth_vk_url('/authorize', redirect_uri: redirect_url).to_s
  end

  def new_access_token_url
    build_oauth_vk_url('/access_token', code: code, redirect_uri: redirect_url).to_s
  end

  def load_email
    response = HTTParty.get new_access_token_url
    return nil unless response.success?

    response.parsed_response["email"]
  end

  private

  def build_oauth_vk_url(path, custom_query = {})
    query = {
      client_id: client_id,
      client_secret: client_secret,
      scope: scope,
      v: version,
    }.merge custom_query

    URI::HTTP.build(
      protocol: 'https',
      host: 'oauth.vk.com',
      path: path,
      query: query.to_query
    )
  end
end
