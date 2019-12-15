
labours = ['Mike','John', 'Naomi', 'Donatelo']
labours.each do |labour|
  Labour.create(name: labour, price: "#{rand(3..10)}0".to_i, status: true, desc: Faker::Lorem.paragraph )
end

spareparts = ['LCD Screen','Keypad','Camera Part','Casing','Sound Part','IC Part']
spareparts.each do |sparepart|
  Sparepart.create(name: sparepart, price: "#{rand(3..10)}0".to_i, status: true, desc: Faker::Lorem.paragraph )
end
