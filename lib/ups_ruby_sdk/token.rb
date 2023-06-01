# frozen_string_literal: true

module UpsRubySdk
  class Token
    class << self
      def create(grant_type="client_credentials", client:)
        auth = {username: UpsRubySdk.configuration.client_id, password: UpsRubySdk.configuration.client_secret}
        token = client.post(path, "grant_type=#{grant_type}", {"Content-Type" => "application/x-www-form-urlencoded"}, basic_auth: auth)

        build token.with_indifferent_access
      end

      private

      def build(token)
        new(
          token[:token_type],
          token[:issued_at],
          token[:client_id],
          token[:access_token],
          token[:scope],
          token[:expires_in],
          token[:refresh_count],
          token[:status]
        )
      end

      def path
        "security/v1/oauth/token"
      end
    end
    def initialize(token_type, issued_at, client_id, access_token, scope, expires_in, refresh_count, status)
      @token_type = token_type
      @issued_at = issued_at
      @client_id = client_id
      @access_token = access_token
      @scope = scope
      @expires_in = expires_in
      @refresh_count = refresh_count
      @status = status
    end
    attr_reader :token_type, :issued_at, :client_id, :access_token, :scope, :expires_in, :refresh_count, :status
  end
end
