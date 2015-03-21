class Job < ActiveRecord::Base
  has_many :search_terms
  accepts_nested_attributes_for :search_terms, reject_if: :all_blank, allow_destroy: true

  validates :name, presence: true
end
