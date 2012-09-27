require 'net/http'

module Persona
    
  def self.verify(assertion, audience)
    url  = "https://verifier.login.persona.org/verify"
    response = HTTParty.post(url, body: { assertion: assertion, audience: audience }).parsed_response

    if response["status"] == "okay"
      { email: response["email"] }
    end
  end
    
end
