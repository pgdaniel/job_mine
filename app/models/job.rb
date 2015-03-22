class Job < ActiveRecord::Base
  has_many :search_terms, dependent: :destroy
  accepts_nested_attributes_for :search_terms, reject_if: :all_blank, allow_destroy: true

  validates :name, presence: true

  after_save :start_searching

  CITIES = [
  'los angeles',
  'san francisco',
  'seattle',
  'new york',
  'boston',
  'chicago',
  'austin',
  'san jose'
  ]

  def start_searching
    CITIES.each do |city|
      search_terms.each do |term|
        SearchWorker.perform_async(term.id, city)
      end
    end
  end
end
