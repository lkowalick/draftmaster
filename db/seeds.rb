User.create_with( password: 'password',
                  password_confirmation: 'password')
.find_or_create_by!(email: 'test@example.com')

ActiveRecord::Base.transaction do
  %w(FRF KTK DTK).each do |set|
    JSON(File.read("data/#{set}.json"))['cards'].each do |card|
      card_record = Card.find_or_create_by!(set: set,
                                            name: card['name'],
                                            number: card['number'],
                                            cmc: card['cmc'],
                                            mana_cost: card['manaCost'],
                                            image_name: card['imageName'])

      card['types'].each do |type_name|
        CardType.find_or_create_by!(card: card_record,
                        type: Type.find_or_create_by!(name: type_name))
      end
    end
  end
end

