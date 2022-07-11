# frozen_string_literal: true

desc "Sync external data from all sources"
task update_all_sources: :environment do
  Om::SyncAllSourcesJob.perform_later
end

desc "Delete old content"
task content_rotation: :environment do
  Om::ContentRotationJob.perform_later
end
