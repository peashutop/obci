set :application, "obci"
set :repository,  "git@github.com:peashutop/obci.git"

set :scm, :git
set :user, "jacob"
set :port, 37658
# password not needed - we've got ssh key
set :branch, "master"
set :use_sudo,    false


role :web, "bc.peashutop.com"                          # Your HTTP server, Apache/etc
role :app, "bc.peashutop.com"                          # This may be the same as your `Web` server
role :db,  "bc.peashutop.com", :primary => true # This is where Rails migrations will run

set :deploy_to, "/home/jacob/#{application}"


#role :db,  "your slave db-server here"

# If you are using Passenger mod_rails uncomment this:
# if you're still using the script/reapear helper you will need
# these http://github.com/rails/irs_process_scripts

# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end