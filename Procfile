web: bundle exec puma -C config/puma.rb
worker: bundle exec sidekiq -t 25
release: bundle exec rake db:migrate

