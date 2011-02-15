set :application, "TakeOne"
set :repository,  "git@github.com:abrahamoshel/Take-One.git"

set :scm, :git
set :user, "aaoshel"
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

set :deploy_to, "schedule.nma.private"



role :web, "schedule.nma.private"                          # Your HTTP server, Apache/etc
role :app, "schedule.nma.private"                          # This may be the same as your `Web` server
role :db,  "schedule.nma.private", :primary => true # This is where Rails migrations will run

# If you are using Passenger mod_rails uncomment this:
# if you're still using the script/reapear helper you will need
# these http://github.com/rails/irs_process_scripts

set :scm_command, "/usr/local/bin/git"
set :local_scm_command, "git"

# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end