module Github
  module Entities
    class Repo < Struct.new(:id, :name, :full_name, :description, :html_url)
    end
  end
end
