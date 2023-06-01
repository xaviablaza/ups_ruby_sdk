# frozen_string_literal: true

require "httparty"

module UpsRubySdk
  class Client
    TEST_API_ENDPOINT = 'https://wwwcie.ups.com'
    API_ENDPOINT = 'https://onlinetools.ups.com'

    def initialize(test: false)
      @test = test
    end

    def post(path, body, headers, basic_auth: nil)
      if headers.empty?
        post_headers = default_post_headers(json_body)
      else
        post_headers = headers
      end
      if post_headers["Content-Type"] == "application/json"
        post_body = body.to_json
      else
        post_body = body
      end
      HTTParty.post(url(path), { body: post_body, headers: post_headers, basic_auth: basic_auth })
    end

    private

    # Returns the base url depending on whether client is instantiated in test or production mode
    # @return base_url [String]
    def base_url
      return TEST_API_ENDPOINT if @test

      API_ENDPOINT
    end

    # Returns a String with the path appended to the base_url
    # @return url [String]
    def url(path)
      "#{base_url}/#{path}"
    end

    def default_post_headers
      {
        'Content-Type' => 'application/json'
      }
    end
  end
end
