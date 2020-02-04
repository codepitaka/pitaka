# frozen_string_literal: true

# gives out permitted hosts for each environments
module PermittedHosts
  def self.development
    Rails.application.configure do
      # local environment hosts
      # TODO for DAVIN: add your local host.
      config.hosts.push 'port-3000-pitaka.run.goorm.io'
      # heroku review app hosts
      config.hosts.push 'pitaka-serve-publish-ap-qc2c9q.herokuapp.com'
      # heroku dev app hosts
      config.hosts.push 'pitaka-server-dev.herokuapp.com'
    end
  end

  def self.production
    Rails.application.configure do
      # heroku prd app hosts
      config.hosts.push 'pitaka-server.herokuapp.com'
    end
  end

  def self.test
    Rails.application.configure do
      # test environment hosts
      config.hosts.push 'www.example.com'
    end
  end
end
