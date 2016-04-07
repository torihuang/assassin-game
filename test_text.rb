require "rubygems"
require "yaml"
require "twilio-ruby"

secret_hash = YAML.load_file("super-secret.yml")
account_sid = secret_hash["development"]["twilio_account_sid"]
auth_token = secret_hash["development"]["twilio_auth_token"]
client = Twilio::REST::Client.new account_sid, auth_token

from = "+18478137513"

client.account.messages.create(
  from: from,
  to: "+17734289157",
  body: "Haaaaaaaaaaaaaay gurl"
  )


