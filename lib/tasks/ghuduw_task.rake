namespace :ghuduw_task do
  desc "TODO"
  task scrapping_dates_task: :environment do
     puts “Updating news Articles…”
    ScrappedDatesJob.perform()
  end

end
