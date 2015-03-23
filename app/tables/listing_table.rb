class ListingTable < TableCloth::Base
  column :title do |listing|
    link_to listing.title, listing_path(listing)
  end

  column :company

  column :company_url do |listing|
    link_to listing.company_url, listing.company_url || 'N/A'
  end

  column :type do |listing|
    listing.type.gsub('Listing', '')
  end
end
