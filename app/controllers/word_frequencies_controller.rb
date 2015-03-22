class WordFrequenciesController < ApplicationController

  COMMON = %w(and to the a of with in we our you for is or that on are your will at be an it all, if as have this like all about us s can etc they real from re by but get san out do who ll some such how looking look new help tools more use we're what work join ability one - up well has not also both plus you'll high including other want through where most come end into so day part just please set you're offer year time know then least way things when write no right next you've must here few any play why each let -- at regardless during back years their understanding using site job)

  TECH = %w(python ruby rails)

  def index
    temp_string = ''
    Listing.all.each { |listing| temp_string << "#{listing.sanitized_description} " }
    if params.has_key? :filter
      @word_frequencies = WordsCounted.count(temp_string, only: TECH).sorted_word_occurrences
    else
      @word_frequencies = WordsCounted.count(temp_string, exclude: COMMON).sorted_word_occurrences
    end
  end
end
