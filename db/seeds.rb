p = Post.create(title: "The first post", content: "This will always be the first post")

u = User.create(username: "dougr81", email: "dougr81@hotmail.com")

c = Comment.new(content: "The first comment ever", post_id: p.id, user_id: u.id)

p.users << u 
p.save

