class EmployeeMailer < Devise::Mailer
  backup_email = "abraham.oshel@gmail.com"
  def headers_for(action)
    headers = {
     :subject       => translate(devise_mapping, action),
     :from          => mailer_sender(devise_mapping),
     :to            => "abraham.oshel@gmail.com",
     :template_path => template_paths
  }
  end
end

