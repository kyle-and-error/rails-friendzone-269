# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'Cleaning up database...'
Event.destroy_all
User.destroy_all
# PotentialAttendee.destroy_all
Category.destroy_all

puts 'Generating users...'
markus = User.new({
    email: 'drunk_ninja@gmail.com',
    password: 'ninjaclub666',
    first_name: 'Markus',
    last_name: 'Jäger',
    avatar:'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a4/Kampfar_Rockharz_2016_08.jpg/220px-Kampfar_Rockharz_2016_08.jpg'
  })

markus.save

saskia = User.new({
    email: 'your_mama_in_pijamas@gmail.com',
    password: 'bananasinpjs',
    first_name: 'Saskia',
    last_name: 'Erlandsson',
    avatar:'https://static1.squarespace.com/static/54f76245e4b08e5a08a87ec8/t/5b1e906b575d1f0e16e80939/1528729713813/Frida+2.jpg?format=750w'
  })

saskia.save


bjarne = User.new({
    email: 'family_guy@gmail.com',
    password: 'mykidisanalien',
    first_name: 'Bjarne',
    last_name: 'Hagerup',
    avatar:'http://www.arkwright.no/images/arkwright%20consulting%20oslo%20-%20eirik%20h%20rommetveit-crop-u45995.jpg?crc=4258710355'
  })

bjarne.save

puts 'Generating test user'

test_user = User.new({
    email: 'test.doe@testing.com',
    password: 'password',
  })

test_user.save

puts 'Email: test.doe@testing.com, password: password'

puts "Generateing categories"
categories = ["sports", "tabletop", "videogames", "movies/tv", "live performances", "outdoors", "food", "party/drinks", "networking", "class session", "other"]
categories.each { |name| Category.create!(category_name: name) }

puts 'Generating events'
Event.create!({
  category_id: 1,
  host: markus,
  name: 'Fencing Session',
  people_needed: 1,
  photo: 'https://i.ytimg.com/vi/ezoZfZK75zA/maxresdefault.jpg',
  address: 'Bikuben, 1086 Oslo' ,
  start_time: 1.days.from_now,
  end_time: 3.days.from_now
})

sleep(2)

Event.create!({
  category_id: 10,
  host: saskia,
  name: 'Meditation Workshop',
  people_needed: 4,
  photo: 'http://www.nedharmacelebration.org/wp-content/uploads/2012/08/VGKG-finger-300x199.jpg',
  address: 'Majorstuveien 26, 0367 Oslo',
  start_time: 1.days.from_now,
  end_time: 3.days.from_now
})

sleep(2)

Event.create!({
  category_id: 11,
  host: bjarne,
  name: 'Afternoon Cooking Class',
  people_needed: 2,
  photo: 'http://www.circuitodellecaveiblee.it/wp-content/uploads/2016/12/rId12.png.jpeg',
  address: 'Vulkan 5, 0178 Oslo',
  start_time: 1.days.from_now,
  end_time: 3.days.from_now
})

sleep(2)

Event.create!({
  category_id: 11,
  host: markus,
  name: 'Sailing Party',
  people_needed: 2,
  photo: 'http://www.sydneybysail.com/images/home/private-charter-low.jpg',
  address: 'Bryggegata 9, 0250 Oslo',
  description: '*Girls only* I need 2 girls to go with me to a Sailing boat trip /party. Please only girls with good vibes ',
  start_time: 1.days.from_now,
  end_time: 3.days.from_now
})

sleep(2)

Event.create!({
  category_id: 11,
  host: markus,
  name: 'Black Metal Concert MIDGARDSBLOT',
  people_needed: 2,
  photo: 'https://i.pinimg.com/originals/2a/6b/02/2a6b02a4c6e50c591e469c294b89fedc.jpg',
  address: 'Rådhusplassen 1, 0037 Oslo',
  description: '*Need at least 1 person to go with me to this amazing concert. My friends are out of town. ',
  start_time: 1.days.from_now,
  end_time: 3.days.from_now
})

sleep(2)

Event.create!({
  category_id: 1,
  host: markus,
  name: 'Friendly Ice Hockey Game',
  people_needed: 3,
  photo: 'https://www.worldatlas.com/upload/7b/8c/df/shutterstock-429393673.jpg',
  address: 'Jordalgata 12, 0657 Oslo',
  description: 'We just going to play for fun, but we missing 3 people in our team. ',
  start_time: 1.days.from_now,
  end_time: 3.days.from_now
})

sleep(2)

Event.create!({
  category_id: 11,
  host: saskia,
  name: 'Opera Night',
  people_needed: 2,
  photo: 'https://www.worldatlas.com/upload/7b/8c/df/shutterstock-429393673.jpg',
  address: 'Kirsten Flagstads Plass 1, 0150 Oslo',
  description: 'Looking for 2 people to go with to the Opera next Saturday.',
  start_time: 1.days.from_now,
  end_time: 3.days.from_now
})

sleep(2)

Event.create!({
  category_id: 11,
  host: bjarne,
  name: 'Sculpting Class',
  people_needed: 1,
  photo: 'https://kimbernadas.com/wp-content/uploads/2015/02/Kim-Bernadas-Plastic-Surgery-Sculpture.jpg',
  address: 'Pilestredet 56, 0167 Oslo',
  description: 'I have one free spot to join this cool sculpting class by this Japanese artist ',
  start_time: 1.days.from_now,
  end_time: 3.days.from_now
})

sleep(2)

Event.create!({
  category_id: 11,
  host: markus,
  name: 'Shopping day',
  people_needed: 1,
  photo: 'https://photos.lasvegassun.com/media/img/photos/2017/11/17/grand_bazaar_shops-42_t653.jpg?214bc4f9d9bd7c08c7d0f6599bb3328710e01e7b',
  description: 'Looking for a girl to enjoy shopping together. Next Saturday afternoon ',
  address: 'Tøyengata 2, 0190 Oslo',
  start_time: 1.days.from_now,
  end_time: 3.days.from_now
})

sleep(2)

Event.create!({
  category_id: 11,
  host: bjarne,
  name: 'Sauna Sesh',
  people_needed: 1,
  photo: 'https://www.adamelloresort.it/images/content/1257754_71193_3_C_1400_620_0_424141772/sauna.jpg',
  description: 'Looking for someone to go with me to the Sauna',
  address: 'Langkaia 1, 0150 Oslo',
  start_time: 1.days.from_now,
  end_time: 3.days.from_now
})

puts 'Creating PotentialAttendees'
PotentialAttendee.create!({
  user_id: 1,
  event_id: 6,
  status: 'accepted',
  initial_message: "Used to be a semi-pro! Lets play!",
})

PotentialAttendee.create!({
  user_id: 2,
  event_id: 6,
  status: 'rejected',
  initial_message: "Used to be a semi-pro! Lets play!",
})
PotentialAttendee.create!({
  user_id: 3,
  event_id: 6,
  status: 'pending',
  initial_message: "Used to be a semi-pro! Lets play!",
})
puts "Finished!"
