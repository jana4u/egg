set :application, "egg"
set :repository, "git://github.com/jana4u/egg.git"
set :scm, "git"

role :web, "server3.railshosting.cz"
role :app, "server3.railshosting.cz"
role :db,  "server3.railshosting.cz", :primary => true

set :deploy_to, "/home/egg/app/"
set :user, "egg"

set :use_sudo, false

set :shared_children, shared_children + %w(uploads)

namespace :deploy do
  task :start, :roles => :app do
  end
end

after "deploy:update_code", "deploy:symlink_shared"

namespace :deploy do
  desc "Symlink files from shared directory"
  task :symlink_shared, :roles => [:app, :db] do
    run "ln -nfs #{shared_path}/config/database2.yml #{release_path}/config/database.yml"
    run "ln -nfs #{shared_path}/uploads #{release_path}/public/uploads"
  end

  desc "Restart Application"
  task :restart, :roles => :app do
    run "touch #{current_path}/tmp/restart.txt"
  end
end

after "deploy:update_code", "bundler:bundle_new_release"

namespace :bundler do
 task :create_symlink, :roles => :app do
   set :bundle_dir, File.join(release_path, 'vendor/bundle')

   shared_dir = File.join(shared_path, 'bundle')
   run "if [ -d #{bundle_dir} ]; then rm -rf #{bundle_dir}; fi" # in the event it already exists..?
   run("mkdir -p #{shared_dir} && ln -s #{shared_dir} #{bundle_dir}")
 end

 task :bundle_new_release, :roles => :app do
   bundler.create_symlink
   run "cd #{release_path} ; RB_USER_INSTALL=1 bundle install --path #{bundle_dir} --deployment"
 end
end
