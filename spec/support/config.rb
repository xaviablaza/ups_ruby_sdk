config = YAML.load_file(SPEC_DIR.join('config.yml')).with_indifferent_access
if client_id = ENV['UPS_CLIENT_ID'].presence
  config[:client_id] = client_id
end
if client_secret = ENV['UPS_CLIENT_SECRET'].presence
  config[:client_secret] = client_secret
end
CONFIG = config
