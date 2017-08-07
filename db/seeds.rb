require 'random_data'


  5.times do
    User.create!(
      name: RandomData.random_name,
      email: RandomData.random_email,
      password: RandomData.random_sentence
    )
  end

  users = User.all

  15.times do
    Topic.create!(
    name: RandomData.random_sentence,
    description: RandomData.random_paragraph
    )
  end

  topics = Topic.all

  50.times do
    Post.create({
      user: users.sample,
      topic: topics.sample,
      title: RandomData.random_sentence,
      body: RandomData.random_paragraph
    })
  end

  50.times do
    Sponsoredpost.create({
      topic: topics.sample,
      name: RandomData.random_sentence,
      body: RandomData.random_paragraph,
      price: RandomData.random_number
    })
  end

  posts = Post.all

  Post.find_or_create_by(title:"Unique Title", body: "Unique Body")

  100.times do
    Comment.create!(
      post: posts.sample,
      body: RandomData.random_paragraph
    )
  end

  user = User.first
  user.update_attributes!(
    email: "jamesvas5307@live.com",
    password: "helloworld"
  )

  puts "Seed finished"
  puts "#{User.count} users created"
  puts "#{Topic.count} topics created"
  puts "#{Post.count} posts created"
  puts "#{Comment.count} comments created"
