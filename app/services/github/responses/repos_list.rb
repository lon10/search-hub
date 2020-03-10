module Github
  module Responses
    class ReposList
      def initialize(resp)
        @resp = resp
      end

      def parse_list
        ::Github::Entities::RepoList.new(
          from_json.dig('items')&.map { |repo_response|
            build_single_repo(repo_response)
          },
          from_json.dig('total_count')&.to_i
        )
      end

      private

      def from_json
        @parsed_response ||= JSON.parse(@resp)
      end

      def build_single_repo(repo_response)
        # Get only the most reasonable keys
        ::Github::Entities::Repo.new(
          repo_response['id'],
          repo_response['name'],
          repo_response['full_name'],
          repo_response['description'],
          repo_response['html_url']
        )
      end
    end
  end
end
