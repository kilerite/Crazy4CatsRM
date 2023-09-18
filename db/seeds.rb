# Genera 25 usuarios
require 'faker'

25.times do
  User.create!(
    email: Faker::Internet.email,
    password: '123456',
    password_confirmation: '123456'
  )
end

users = User.all

# Genera 20 posts asociados a usuarios aleatorios y si el rand es 1 guarda la reacción del usuario
20.times do
  post = Post.create!(
    title: Faker::Lorem.sentence,
    content: Faker::Lorem.paragraph,
    user_id: users.pluck(:id).sample
  )

  users.each do |user|
    if rand(0..1) == 1
      Reaction.create!(
        user: user,
        post: post
      )
    end
  end
end
