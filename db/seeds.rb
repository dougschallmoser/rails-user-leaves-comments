p = Post.create(title: "The first post", content: "This will always be the first post")

u = User.create(username: "dougr81", email: "dougr81@hotmail.com")

c = Comment.create(content: "The first comment ever", post_id: p.id, user_id: u.id)

p.users << u 
p.save

p = Post.create(title: "The second post", content: "This will always be the second post")

u = User.create(username: "johnson", email: "johnson@aol.com")

c = Comment.create(content: "The second comment ever", post_id: p.id, user_id: u.id)

p.users << u 
p.save

c = Comment.create(content: "Third comment made boy!", post_id: Post.first.id, user_id: User.first.id)

