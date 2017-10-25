class DeploymentUtils

  def self.help
    "Usage: deploy_prod('example.com', 'foobar')"
  end

  def self.deploy_prod(_target_host, _password)
    byebug
    "* Important magic happens here *"
  end

end