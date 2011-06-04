class DestroyMailer < ActionMailer::Base

  default :from => "NMA Schedule <nmaschedule@apple.com>"

    def shift_destroy(shift)
      @shift = shift
      @url = "http://www.apple.com"
      headers "Reply-to" => "nmaschedule@apple.com"
      attachments.inline['scheduleTeam.png'] = File.read(Rails.root.join('public/images/scheduleTeam.png'))
      @css = File.read(File.join(Rails.root, 'public', 'stylesheets', 'notifier.css')).gsub(/\/images\/([a-zA-Z\-\_]+\.jpg)/) do |match|
          attachments.inline[$1] = File.read File.join(Rails.root, 'public', 'images', $1)
          attachments.inline[$1].url
      end
      mail(:to => [shift.email, "nmaschedule@apple.com"],
          :subject => "A Shift Deleted!")
    end
end
