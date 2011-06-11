############################################
#     Application
############################################

set :application, "TakeOne"
set :deploy_to, "/Library/WebServer/Documents/rails/schedule.nma.private/"
set :web_server_type,   :apache 
set :app_server_type,   :passenger
set :ruby_vm_type,      :ree   # replaces set :passenger_use_ree 

############################################
#     Settings     
############################################

default_run_options[:pty] = true
set :use_sudo, false


############################################
#     Servers
############################################

set :user, ""
set :runner, user
set :group, "admin"

role :web, "schedule.nma.private"                          # Your HTTP server, Apache/etc
role :app, "schedule.nma.private"                          # This may be the same as your `Web` server
role :db,  "schedule.nma.private", :primary => true # This is where Rails migrations will run

#set :mongrel_cmd, "/usr/bin/mongrel_rails_persist"
#set :mongrel_ports, 3000..3003

############################################
#     Git
############################################

set :repository,  ""
set :scm, :git
set :scm_username, ""
set :scm_password, ""
set :scm_command, "/usr/local/bin/git"
set :local_scm_command, "git"

#############################################
#     Passenger
############################################ 

namespace :passenger do
  desc "Restart Application"
  task :restart do
    run "touch #{current_path}/tmp/restart.txt"
  end
end

after :deploy, "passenger:restart"





# If you are using Passenger mod_rails uncomment this:
# if you're still using the script/reapear helper you will need
# these http://github.com/rails/irs_process_scripts

deploy.task :restart, :roles => :app do
  run "touch #{current_path}/tmp/restart.txt"
end



# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end

#namespace :deploy do

#  desc "Start Mongrels processes and add them to launchd."
#  task :start, :roles => :app do
#    mongrel_ports.each do |port|
#      sudo "#{mongrel_cmd} start -p #{port} -e production \
#            --user #{user} --group #{group} -c #{current_path}"
#    end
#  end

#  desc "Stop Mongrels processes and remove them from launchd."
#  task :stop, :roles => :app do
#    mongrel_ports.each do |port|
#      sudo "#{mongrel_cmd} stop -p #{port}"
#    end
#  end

#  desc "Restart Mongrel processes"
#  task :restart, :roles => :app do
#    stop
#    start
#  end
 
#end
