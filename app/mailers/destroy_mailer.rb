class DestroyMailer < ActionMailer::Base
<<<<<<< HEAD

  default :from => "NMA Schedule <nmaschedule@apple.com>"
=======
  ActionMailer::Base.sendmail_settings = {
    :location       => '/usr/sbin/sendmail',
    :arguments      => '-i'
  }
    
  default :from => "Abraham Oshel <abraham.oshel@gmail.com>"
>>>>>>> 6882626e30f05d3b7b8a19225bffcac49b842e11

    def shift_destroy(shift)
      @shift = shift
      @url = "http://www.apple.com"
<<<<<<< HEAD
      headers "Reply-to" => "nmaschedule@apple.com"
      attachments.inline['scheduleTeam.png'] = File.read(Rails.root.join('public/images/scheduleTeam.png'))
=======
      headers "Reply-to" => "abraham.oshel@gmail.com"
      attachments.inline['PeopleTeamLogo.png'] = File.read(Rails.root.join('public/images/PeopleTeamLogo.png'))
>>>>>>> 6882626e30f05d3b7b8a19225bffcac49b842e11
      @css = File.read(File.join(Rails.root, 'public', 'stylesheets', 'notifier.css')).gsub(/\/images\/([a-zA-Z\-\_]+\.jpg)/) do |match|
          attachments.inline[$1] = File.read File.join(Rails.root, 'public', 'images', $1)
          attachments.inline[$1].url
      end
        
<<<<<<< HEAD
      mail(:to => [shift.email, shift.takingEmail, "nmaschedule@apple.com"],
=======
      mail(:to => [shift.email, shift.takingEmail, "oldschoolpreach@gmail.com"],
>>>>>>> 6882626e30f05d3b7b8a19225bffcac49b842e11
          :subject => "A Shift Deleted!")
    end
 
end
