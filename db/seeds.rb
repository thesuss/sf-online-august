klasses = [ShoppingCartItem, ShoppingCart, Dish, Menu, Restaurant, User]
old_counts = klasses.map(&:count)
should_prompt = old_counts.min  0

def yes_no(prompt)
  print [prompt.blue, 'yes(y)/no(n): '].join(' ')
  str = STDIN.gets.downcase.chomp
  if str.chr == 'y'
    true
  else
    str.chr == 'n' ? false : yes_no(prompt)
  end
end

def create_restaurant(args = {})
  suffix = %W(Place Parlor House Bar Food\ Court Pub)
  prefix = %w(The Local Homemade Fancy Skitbra)
  cat = %w(Italian Thai Pizza Vegan).sample
  name = "#{prefix.sample} #{cat} #{suffix.sample}"
  description = args[:description] || Faker::Lorem.paragraph(2)
  address = args[:address] || [Faker::Address.street_address, Faker::Address.postcode, Faker::Address.city].join(', ')
  lat = rand(57.69..57.7090009).round(7)
  lon = rand(11.9691..11.9800009).round(7)
  rest = Restaurant.new(name: name,
                        description: description,
                        # zipcode: address,
                        category: cat,
                        # user: User.all.sample,
                        latitude: lat,
                        longitude: lon)
  rest.save(validate: false)
end

def build_menus_with_dishes(menu_names)
  Restaurant.all.each do |restaurant|
    menu_names.each do |menu_name|
      #menu = Menu.create(name: menu_name, restaurant: restaurant)
      menu = Menu.create(title: menu_name, restaurant: restaurant)

      3.times { |i| add_dish(i + 1, menu, restaurant) }
    end
  end
end

def add_dish(number, menu, restaurant)
  price = rand(20..60)
  prefix = restaurant.category
  Dish.create(name: "#{prefix} Dish #{number}",
              price: price,
              description: "A great #{restaurant.category} dish!",
              # category: Dish::CATEGORIES.sample
              menu_ids: menu.id,
              restaurant_id: restaurant.id
              )
end

puts '**************************************'.green
puts ' SlowFoodOnline Dummy Data Generator?'.yellow
puts '                  BETA'.yellow
puts '**************************************'.green
puts '               Ready?'.yellow
puts '**************************************'.green
puts ''
yes_no('Simon asks - What do you say? ') ? puts('You said yes!') : puts('You said no!')
puts ''
puts '**************************************'.green
puts '     Alright, Here we go!'.yellow
puts '**************************************'.green
puts ''

if should_prompt
  if yes_no('Would you like to ' + 'delete'.red + ' all the existing data from the database?')
    puts 'Clearing existing data'.red
    klasses.each(&:destroy_all)
  else
    puts '**************'.red + ' Be advised! '.yellow + '**************'.red
    puts 'Remember that if you seed the database with'.red
    puts 'new data without deleting old records you will'.red
    puts 'most probably duplicate a lot of the objects.'.red
    puts ''
  end
end

puts 'Moving on...'
puts ''
puts "There are currently #{User.count} Users in the system".red
puts "There are currently #{Restaurant.count} Restaurants in the system".red
puts "There are currently #{Menu.count} Menus in the system".red
puts "There are currently #{Dish.count} Dishes in the system".red

if yes_no('Create System Users')
  10.times do
    name = Faker::Name.name
    User.create(email: Faker::Internet.safe_email(name),
                password: 'password', address: 'address', name: name)
  end
  puts "There are now #{User.count} Users in the system".yellow
end

if yes_no('Create some Restaurants')
  10.times do
    create_restaurant
  end
  puts "There are now #{Restaurant.count} Restaurants in the system".yellow
end

if yes_no('Create some random dishes')
  build_menus_with_dishes(%W(Lunch À\ la\ carte Dinner))
  puts "There are now #{Menu.count} Menus in the system".yellow
  puts "There are now #{Dish.count} Dishes in the system".yellow
end

puts ''
puts '**************************************'.green
puts '            That\'s it!'.yellow
puts '**************************************'.green
puts ''
