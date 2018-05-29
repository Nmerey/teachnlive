set :application, "deploy_test"
set :repo_url, "git@github.com:syami-ifcon/teachnlive.git"

set :deploy_to, '/home/deploy/deploy_test'

append :linked_files, "config/database.yml", "config/secrets.yml"
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "vendor/bundle", "public/system", "public/uploads"