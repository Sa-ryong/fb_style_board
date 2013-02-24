namespace :db do
  desc 'Fill database with sample data'
  task :populate => :environment do
    make_users
    make_posts
    make_relationships
  end

  def make_users
    admin = User.create!(name: 'Test Admin', email: 'admin@test.com')
    #admin.toggle!(:admin)
    99.times do |n|
      name = Faker::Name.name
      email = Faker::Internet.email
      User.create!(name: name, email: email)
    end
  end

  def make_posts
    users = User.all(limit: 6)
    50.times do
      body = Faker::Lorem.paragraph
      users.each { |user| user.posts.create!(body: body) }
    end
  end

  def make_relationships

  end
end