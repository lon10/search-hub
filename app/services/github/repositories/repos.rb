module Github
  module Repositories
    class Repos
      def search(search_string)
        Rails.logger.info('Getting repositoreis from github')

        ::Github::Responses::ReposList.new(
          gateway.search_repos(search_string)
        ).parse_list
      rescue RestClient::UnprocessableEntity => ex
        Rails.logger.error(ex.message)

        nil
      end

      private

      def gateway
        @gateway ||= ::Github::Gateway.new
      end
    end
  end
end
