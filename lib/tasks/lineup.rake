namespace :lineup do
  desc 'Generate number for ticket'
  task generate_number: :environment do
    Lineup.add_one
  end
end
