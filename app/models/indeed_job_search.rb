class IndeedJobSearch
  def initialize(term, location)
    @term = term
    @location = URI::escape(location)

    fetch_and_parse
    create_listings
  end

  def fetch_and_parse
    url = "http://api.indeed.com/ads/apisearch?publisher=2445486050700467&q=#{@term.value}&l=#{@location}&v=2&format=json"
    response = HTTParty.get(url)
    @listings = JSON.parse(response.body)['results']
  end

  def create_listings
    @listings.each do |listing|
      @term.indeed_listings.create(
        title: listing['jobtitle'],
        description: listing['snippet'],
        company: listing['company'],
        url: listing['url']
      )
    end
  end
end
