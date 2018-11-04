namespace :cron_jobs do
  desc 'Set cron expressions for jobs to run repeatedly.'
  task :set => [ :environment ] do
    puts 'Set facebook notification check'
    CheckFacebookNotificationsJob.set(cron: '*/30 * * * *').perform_later
  end
end
