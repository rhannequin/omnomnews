web: bundle exec puma -t 5:5 -p ${PORT:-3000} -e ${RACK_ENV:-development}
worker: bundle exec sidekiq

# https://devcenter.heroku.com/articles/scheduled-jobs-custom-clock-processes
clock: bundle exec clockwork clock.rb
