desc 'Add card data to database'
task add_card_data: :environment do
  %w{ FRF KTK }.each do |set|
    JSON(File.read("data/#{set}.json"))['cards'].each do |card|
      card_record = Card.find_or_create_by!(set: set,
                                            name: card['name'],
                                            number: card['number'],
                                            cmc: card['cmc'],
                                            mana_cost: card['manaCost'])

      card['types'].each do |type_name|
        CardType.create(card: card_record, type: Type.find_or_create_by!(name: type_name))
      end
    end
  end
end
