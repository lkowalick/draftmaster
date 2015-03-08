desc 'Add card data to database'
task add_card_data: :environment do
  %w{ FRF KTK }.each do |set|
    JSON(File.read("data/#{set}.json"))['cards'].each do |card|
      Card.find_or_create_by!(set: set, name: card['name'], number: card['number'])
    end
  end
end
