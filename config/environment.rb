# Load the rails application
require File.expand_path('../application', __FILE__)

Time_zone = "Central Time (US & Canada)"


Time::DATE_FORMATS[:due] = "due on %B %d at %I:%M %p"
Time::DATE_FORMATS[:time] = "%l:%M %p"
Time::DATE_FORMATS[:app_date] = "due on %B %d at %I:%M %p"
# Initialize the rails application
Takeone::Application.initialize!

