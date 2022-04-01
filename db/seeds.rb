Role.destroy_all
Audition.destroy_all

puts "Seeding database..."
50.times do
    role = Role.create(character_name: Faker::Name.name)
    rand(1..10).times do
        Audition.create(
            actor: Faker::Name.name,
            location: Faker::Address.city,
            phone: Faker::Number.number(10),
            hired: Faker::Boolean.boolean,
            role_id: role.id
        )
    end
end
puts "Database seeded!"
