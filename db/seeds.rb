require 'random_data'


  50.times do
    Post.create({
      title: RandomData.random_sentence,
      body: RandomData.random_paragraph
    })
  end

  50.times do
    Advertisement.create({
      title: RandomData.random_sentence,
      body: RandomData.random_paragraph,
      price: RandomData.random_number
    })
  end
  advertisements = Advertisement.all
  posts = Post.all

  Post.find_or_create_by(title:"Unique Title", body: "Unique Body")

  100.times do
    Comment.create!(
      post: posts.sample,
      body: RandomData.random_paragraph
    )
  end

  puts "Seed finished"
  puts "#{Post.count} posts created"
  puts "#{Comment.count} comments created"
