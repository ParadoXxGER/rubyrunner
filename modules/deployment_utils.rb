require 'net/http'

class DeploymentUtils

  def self.help
    "Usage: deployment"
  end

  def self.deploy_prod(_target_host, _password)
    "Deploying #{_pattern + _rename}"
  end

  def self.get_status(_url)
    uri = URI.parse(_url)
    response = Net::HTTP.get_response(uri)
    response
  end



end