class GithubJobSearch
  def initialize(term, location)
    @term = term
    @location = URI::escape(location)

    fetch_and_parse
    create_listings
  end

  def fetch_and_parse
    url = "https://jobs.github.com/positions.json?description=#{@term.value}&location=#{@location}"
    response = HTTParty.get(url)
    @listings = JSON.parse(response.body)
  end

  def create_listings
    @listings.each do |listing|
      @term.github_listings.create(listing.select {|k,v| allowed_keys.include?(k) })
    end
  end

  def allowed_keys
    Listing.column_names - %w[id created_at updated_at type]
  end
end
