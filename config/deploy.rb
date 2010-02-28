set :application, "obci"
set :repository,  "git@github.com:peashutop/obci.git"

set :scm, :git
set :user, "jacob"
set :port, 37658
# password not needed - we've got ssh key
set :branch, "master"
set :use_sudo,    false

after "deploy", "deploy:cleanup"

role :web, "bc.peashutop.com"                          # Your HTTP server, Apache/etc
role :app, "bc.peashutop.com"                          # This may be the same as your `Web` server
role :db,  "bc.peashutop.com", :primary => true # This is where Rails migrations will run

set :deploy_to, "/home/jacob/#{application}"

set :stages, %w(staging production demo dev jgl)
set :default_stage, "production"
require 'capistrano/ext/multistage'

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end

#role :db,  "your slave db-server here"