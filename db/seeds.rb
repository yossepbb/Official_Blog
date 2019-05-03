# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

moderator = Moderator.create(
	fullname: "Joseph BINYOUM",
	username: "yossep@munngano.com",
	password: "12345678")


10.times do 
	
	# créer un post
	post = Post.create(

		title: Faker::Lorem.sentence(20),
		content: Faker::Lorem.paragraph,
		publish: true,
		moderator: moderator)

	# créer un tag 
	tag = Tag.create( name: Faker::Lorem.word)

	# créer un post tag
	post_tag = PostTag.create(post: post, tag: tag)

	# créer un visiteur
	visitor = Visitor.create(fullname: Faker::Name.name,
		 email: Faker::Internet.email)

	# créer un commentaire
	comment = Comment.create(
		message: Faker::Lorem.paragraph,
		status: [true, false].sample,
		post: post,
		visitor: visitor)

	# créer un message
	message = Message.create(
		content: Faker::Lorem.paragraph,
		status: [true, false].sample,
		visitor: visitor )

	notifiable = [visitor, comment].sample

	notification = Notification.create(

			notifiable_id: notifiable.id,
			notifiable_type: notifiable.class.name
		)
end