require 'bundler/capistrano'

$:.unshift(File.expand_path('./lib', ENV['rvm_path']))

# Load RVM's capistrano plugin.    
require "rvm/capistrano"

set :rvm_ruby_string, '1.9.2'
set :rvm_type, :user

set :application, "smackdab"
set :repository,  "git@github.com:jgervin/emailapp.git"
set :user, "deploy"

set :deploy_to, "/home/deploy/smackdab"
set :use_sudo, false
set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "184.106.66.234"                          # Your HTTP server, Apache/etc
role :app, "184.106.66.234"                          # This may be the same as your `Web` server
role :db,  "184.106.66.234", :primary => true        # This is where Rails migrations will run

# If you are using Passenger mod_rails uncomment this:
# if you're still using the script/reapear helper you will need
# these http://github.com/rails/irs_process_scripts

namespace :deploy do

  task :symlink_shared do
    #run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  end

  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end