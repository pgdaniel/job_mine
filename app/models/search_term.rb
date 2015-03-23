class SearchTerm < ActiveRecord::Base
  belongs_to :job
  has_many :listings
  has_many :github_listings
  has_many :indeed_listings

  validates :value, presence: true
end
