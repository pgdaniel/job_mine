class SearchTermsController < ApplicationController
  def show
    @search_term = SearchTerm.find(params[:id])
  end
end
