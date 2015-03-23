class Listing < ActiveRecord::Base
  belongs_to :search_term

  def sanitized_description
    ActionView::Base.full_sanitizer.sanitize(description)
  end

  def sorted_words
    WordsCounted.count(sanitized_description).sorted_word_lengths
  end

  def sentiment_score
    # Sentimentalizer.analyze(sanitized_description).overall_probability
    'TBD'
  end
end
