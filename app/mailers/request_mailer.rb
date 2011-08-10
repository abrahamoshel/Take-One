class RequestMailer < ActionMailer::Base

  default :from => "NMA Schedule <nmaschedule@apple.com>"

    def request_off(request)
      @request = request
      @url = "http://www.apple.com"
      headers "Reply-to" => "nmaschedule@apple.com"
      attachments.inline['scheduleTeam.png'] = File.read(Rails.root.join('public/images/scheduleTeam.png'))
      @css = File.read(File.join(Rails.root, 'public', 'stylesheets', 'notifier.css')).gsub(/\/images\/([a-zA-Z\-\_]+\.jpg)/) do |match|
          attachments.inline[$1] = File.read File.join(Rails.root, 'public', 'images', $1)
          attachments.inline[$1].url
      end
      mail(:to => [request.email, "oldschoolpreach@mac.com"],
          :subject => "A New Request")
    end
end
