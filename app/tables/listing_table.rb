class ListingTable < TableCloth::Base
  column :title do |listing|
    link_to listing.title, listing_path(listing)
  end
end
