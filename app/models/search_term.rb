class SearchTerm < ActiveRecord::Base
  belongs_to :job
  has_many :listings

  validates :value, presence: true
end
