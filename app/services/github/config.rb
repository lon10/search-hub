module Github
  class Config < Settingslogic
    source "#{Rails.root}/config/github_config.yml"
    namespace 'default'
  end
end
