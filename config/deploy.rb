set :application, "first_rails"
set :repo_url, "git@github.com:syami-ifcon/teachnlive.git"

set :deploy_to, '/home/deploy/first_rails'

append :linked_files, "config/database.yml", "config/secrets.yml"
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "vendor/bundle", "public/system", "public/uploads"