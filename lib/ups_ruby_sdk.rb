# frozen_string_literal: true

require "gem_config"
require "ups_ruby_sdk/version"
require "ups_ruby_sdk/client"
require "ups_ruby_sdk/token"
require "ups_ruby_sdk/rate"
require "ups_ruby_sdk/shipment"

module UpsRubySdk
  include GemConfig::Base

  with_configuration do
    has :client_id, classes: String
    has :client_secret, classes: String
  end
end
