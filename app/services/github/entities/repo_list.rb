module Github
  module Entities
    class RepoList < Struct.new(:repos, :total_count)
    end
  end
end
