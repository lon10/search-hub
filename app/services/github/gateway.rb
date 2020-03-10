module Github
  class Gateway
    def search_repos(search_string)
      url = [config.host, config.repos_search_uri].join('/')

      query_sting = ::Github::Requests::ReposSearch.new.search(search_string)
      get([url, query_sting].join('?'))
    end

    private

    def config
      @config ||= ::Github::Config.new
    end

    def get(url)
      RestClient.get(url)
    end
  end
end
