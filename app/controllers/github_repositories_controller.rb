class GithubRepositoriesController < ApplicationController
  def search
    if search_params[:search_string].present?
      repository = ::Github::Repositories::Repos.new

      @repos_list = repository.search(search_params[:search_string])
    end
  end

  private

  def search_params
    params.permit(:search_string, :authenticity_token, :commit)
  end
end
