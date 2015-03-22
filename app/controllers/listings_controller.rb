class ListingsController < ApplicationController
  def index
    @listings = SearchTerm.find(params[:search_term_id]).listings
  end

  def show
    @listing = Listing.find(params[:id])
  end
end
