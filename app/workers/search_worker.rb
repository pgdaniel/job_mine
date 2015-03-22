class SearchWorker
  include Sidekiq::Worker

  def perform(term_id, city)
    term = SearchTerm.find(term_id)
    GithubJobSearch.new(term, city)
  end
end
