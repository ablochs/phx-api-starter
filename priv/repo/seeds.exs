# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Blog.Repo.insert!(%Blog.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Blog.Repo
alias Blog.Accounts.User
alias Blog.Posts.{Post, Comment}

password = "asdfasdf"
password_hash = Comeonin.Bcrypt.hashpwsalt(password)

users = [
  %User{
    "first_name": "The",
    "last_name": "Dude",
    "email": "thedude@gmail.com",
    "password_hash": password_hash
  },
  %User{
    "first_name": "Walter",
    "last_name": "Sobchak",
    "email": "aworldofpain@gmail.com",
    "password_hash": password_hash
  },
]

Enum.each(users, fn (user) -> Repo.insert(user) end)

posts = [
  %Post{
    "title": "The Plan",
    "body": "When we make the handoff, I double back, grab one of 'em and beat it out of him!",
    "user_id": 2
  },
  %Post{
    "title": "Lots of in and oust",
    "body":
      "This is a very complicated case, Maude." <>
      "You know, a lotta ins, a lotta outs, a lotta what-have-yous." <>
      "And, uh, a lotta strands to keep in my head, man." <>
      "Lotta strands in old Duder's head",
    "user_id": 1
  },
  %Post{ "title": "Let's go bowling1", "body": "", "user_id": 1},
  %Post{ "title": "Let's go bowling2", "body": "", "user_id": 1},
  %Post{ "title": "Let's go bowling3", "body": "", "user_id": 1},
  %Post{ "title": "Let's go bowling4", "body": "", "user_id": 1},
  %Post{ "title": "Let's go bowling5", "body": "", "user_id": 1},
  %Post{ "title": "Let's go bowling6", "body": "", "user_id": 1},
  %Post{ "title": "Let's go bowling7", "body": "", "user_id": 1},
  %Post{ "title": "Let's go bowling8", "body": "", "user_id": 1},
  %Post{ "title": "Let's go bowling9", "body": "", "user_id": 1},
]

Enum.each(posts, fn (post) -> Repo.insert(post) end)

# comments = [
#   %Comment{
#     "body":
#       "Yeah. That's a great plan, Walter.
#       That's fucking ingenious, if I
#       understand it correctly. That's a
#       Swiss fucking watch.",
#     "post_id": 1,
#     "user_id": 1
#   },
#   %Comment{
#     "body":
#       "Thaaat's right, Dude.  The beauty of
#       this is its simplicity. If the plan
#       gets too complex something always
#       goes wrong.  If there's one thing I
#       learned in Nam--",
#     "post_id": 1
#     "user_id": 2
#   },
#   %Comment{
#     "body": "Learn basic types",
#     "post_id": 2
#   },
#   %Comment{
#     "body": "Learn pattern matching",
#     "post_id": 2
#   },
# ]

# Enum.each(comments, fn (comment) -> Repo.insert(comment) end)
