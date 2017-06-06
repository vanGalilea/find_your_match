user1 = User.create!(email: "user1@user.com", password:"abc123", name: "Bob bob", admin: true)
user2 = User.create!(email: "user2@user.com", password:"abc123", name: "Boby boby",admin: false)
user3 = User.create!(email: "user3@user.com", password:"abc123", name: "Bobo bobo",admin: false)
user4 = User.create!(email: "user4@user.com", password:"abc123", name: "Boba boba",admin: false)

match1 = Match.create!(student_a: user2.id, student_b: user3.id, date: Time.now, total_matches: 0)
match2 = Match.create!(student_a: user3.id, student_b: user4.id, date: Time.now, total_matches: 0)
match3 = Match.create!(student_a: user2.id, student_b: user4.id, date: Time.now, total_matches: 0)
