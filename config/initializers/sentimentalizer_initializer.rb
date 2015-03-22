require 'sentimentalizer'

JobMine::Application.configure do
  config.after_initialize do
    Sentimentalizer.setup
  end
end
