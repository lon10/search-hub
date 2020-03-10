module Github
  module Requests
    class ReposSearch
      def search(search_string, sort='stars', order='asc')
        query = ["q=#{search_string}"]
        query << "sort=#{sort}"
        query << "order=#{order}"

        query.join('&')
      end
    end
  end
end
