#require 'capistrano_recipes'

set :server, :passenger

ssh_options[:forward_agent] = true
set :repository, "git@github.com:MOBAP2010/interactivehomedevicecontroller.git"  # Your clone URL
set :scm, "git"
set :branch, "master"
set :user, "raskhadafi"  # The server's user for deploys
set :deploy_via, :remote_cache
set :deploy_to, '/srv/good2go.ch/android/'
set :git_enable_submodules, 1
set :copy_exclude, [".git", "spec"]

set :application, "interactivehomedevicecontroller"
set :use_sudo, false

set :rvm_ruby_string, "1.9.2@rails3"
set :rvm_type, :system

# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "android.good2go.ch"                          # Your HTTP server, Apache/etc
role :app, "android.good2go.ch"                          # This may be the same as your `Web` server
#role :db,  "your primary db-server here", :primary => true # This is where Rails migrations will run
role :db,  "android.good2go.ch", :primary => true 

# If you are using Passenger mod_rails uncomment this:
# if you're still using the script/reapear helper you will need
# these http://github.com/rails/irs_process_scripts

require "bundler/capistrano"
after "bundle:install", "deploy:migrate"

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end

desc "Change group to www-data"
task :chown_to_www_data, :roles => [ :app, :db, :web ] do
        sudo "chown -R #{user}:www-data #{deploy_to}"
end 

desc "Fix file permissions"
task :fix_file_permissions, :roles => [ :app, :db, :web ] do
        sudo "chmod -R g+rw #{current_path}/tmp"
        sudo "chmod -R g+rw #{current_path}/log"
        sudo "chmod -R g+rw #{current_path}/public/system"
end 
#set :default_environment, {
#  'PATH' => "/usr/local/rvm/gems/ruby-1.9.2-p0@rails3:/usr/local/rvm/rubies/ruby-1.9.2-p0/bin:$PATH",
#  'RUBY_VERSION' => 'ruby 1.9.2',
#  'GEM_HOME'     => '/usr/local/rvm/gems/ruby-1.9.2-p0',
#  'GEM_PATH'     => '/usr/local/rvm/gems/ruby-1.9.2-p0@rails3',
#  'BUNDLE_PATH'  => '/usr/local/rvm/gems/ruby-1.9.2-p0/bin/bundle'
#}
