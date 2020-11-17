desc "Sync external data from all sources"
task update_all_sources: :environment do
  Om::SyncAllSourcesJob.perform_later
end
