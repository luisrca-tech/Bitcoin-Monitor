namespace :bitcoin do
  desc "Seed initial Bitcoin price data"
  task seed: :environment do
    puts "Seeding initial Bitcoin price data..."

    # Create a record from 24 hours ago
    Bitcoin.create!(
      price: 65000.00,
      timestamp: 24.hours.ago
    )

    # Create a current record
    Bitcoin.create!(
      price: 67000.00,
      timestamp: Time.current
    )

    puts "Seeded #{Bitcoin.count} Bitcoin price records"
  end
end
