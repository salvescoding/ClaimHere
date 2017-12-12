class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    # @query = params[:search]
    # company = Company.search_full_text(@query)
  end
end
