# RubyRunner

### A extendable, interactive and live reloading ruby shell

You can use RubyRunner for executing tasks, which may be to ugly to code in bash or something.

**Use cases:**

- Deployments
- File actions (copy, delete, rename)
- Any automation task you could imagine

**A example Utility Class:**

```ruby

require 'net/http'

class DeploymentUtils

  def self.help
    "Usage: deploy_prod('example.com', 'foobar')"
  end

  def self.deploy_prod(_target_host, _password)
    "Deploying #{_pattern + _rename}"
  end

  def self.get_status(_url)
    uri = URI.parse(_url)
    # May validate? Just do it! It's pure ruby! <3
    response = Net::HTTP.get_response(uri)
    response
  end

end

```

You can use any Ruby internal you want.

Just add any ruby file underneath `modules/` they will be auto-loaded and are available with their class names

Start RubyRunner by the following command: `irb -I . -r lib/ruby_runner.rb` or build the docker image if the utility is ready for usage.

```
Niklass-MacBook-Pro:rubyrunner niklas.hanft$ irb -I . -r lib/ruby_runner.rb
INFO: Including: Deployment_utils
INFO: Including: File_utils
INFO: Including: Image_utils
### Rubyrunner: a extendable and interactive ruby shell ### 
FileUtils.time
=> 2017-10-25 22:05:53 +0200
```

If you are running `irb -I . -r lib/ruby_runner.rb` you can add/edit any file in `modules/`the changes will be live-reloaded.
### Features:

- Live reloading
- Extendability
- Docker image
- Easy to use

### Debugging

With RubyRunner you can even use byebug for hitting your actions step by step:

```ruby

class DeploymentUtils

  def self.help
    "Usage: deploy_prod('example.com', 'foobar')"
  end

  def self.deploy_prod(_target_host, _password)
    byebug
    "* Important magic happens here *"
  end

end

```

```
Niklass-MacBook-Pro:rubyrunner niklas.hanft$ irb -I . -r lib/ruby_runner.rb
INFO: Including: Deployment_utils
INFO: Including: File_utils
INFO: Including: Image_utils
### Rubyrunner: a extendable and interactive ruby shell ###
irb(main):002:0> DeploymentUtils.deploy_prod('example.com', 'foobar')

[3, 12] in /Users/niklas.hanft/Documents/Development/Ruby/rubyrunner/modules/deployment_utils.rb
    3:   def self.help
    4:     "Usage: deploy_prod('example.com', 'foobar')"
    5:   end
    6: 
    7:   def self.deploy_prod(_target_host, _password)
    8:     byebug
=>  9:     "* Important magic happens here *"
   10:   end
   11: 
   12: end
```

Checkout byebug for documentation: https://github.com/deivid-rodriguez/byebug

NOTE: I am currently a junior developer and i am very happy about your feedback! 
If you find any suggestions about my code style, please let me know!