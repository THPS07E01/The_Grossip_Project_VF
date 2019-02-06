User.destroy_all
Gossip.destroy_all
Comment.destroy_all
City.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('users')
ActiveRecord::Base.connection.reset_pk_sequence!('gossips')
ActiveRecord::Base.connection.reset_pk_sequence!('cities')
ActiveRecord::Base.connection.reset_pk_sequence!('comments')

50.times do |c|
    city = City.create!(
        name: Faker::Pokemon.location,
        zipcode: rand(10000..97000)
    )
    print '.'
end
puts '=== City DB created ==='

50.times do |i|
	user = User.create!(
    first_name: Faker::Superhero.prefix,
    last_name: Faker::BackToTheFuture.character,
    username: Faker::DragonBall.character,
    email: Faker::Internet.email,
    age: rand(12..120),
    city_id: rand(1..50),
    description: Faker::StrangerThings.quote)
  print '.'
end
puts '=== User DB created ==='

50.times do |j|
	gossip = Gossip.create!(
    user_id: User.all.sample.id,
    title: Faker::Pokemon.move,
    content: Faker::StarWars.wookiee_sentence)
	print '.'
end
puts '=== Gossip DB created ==='

300.times do |c|
    comment = Comment.create!(
        user_id: User.all.sample.id,
        gossip_id: Gossip.all.sample.id,
        content: Faker::DrWho.quote )
    print '.'
end
puts '=== Comment DB created ==='
