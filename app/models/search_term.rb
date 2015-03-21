class SearchTerm < ActiveRecord::Base
  belongs_to :job

  validates :value, presence: true
end
