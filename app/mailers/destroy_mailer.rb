class DestroyMailer < ActionMailer::Base
  ActionMailer::Base.sendmail_settings = {
    :location       => '/usr/sbin/sendmail',
    :arguments      => '-i'
  }
    
  default :from => "Abraham Oshel <abraham.oshel@gmail.com>"

    def shift_destroy(shift)
      @shift = shift
      @url = "http://www.apple.com"
      headers "Reply-to" => "abraham.oshel@gmail.com"
      attachments.inline['PeopleTeamLogo.png'] = File.read(Rails.root.join('public/images/PeopleTeamLogo.png'))
      @css = File.read(File.join(Rails.root, 'public', 'stylesheets', 'notifier.css')).gsub(/\/images\/([a-zA-Z\-\_]+\.jpg)/) do |match|
          attachments.inline[$1] = File.read File.join(Rails.root, 'public', 'images', $1)
          attachments.inline[$1].url
      end
        
      mail(:to => [shift.email, shift.takingEmail, "oldschoolpreach@gmail.com"],
          :subject => "A Shift Deleted!")
    end
 
end
