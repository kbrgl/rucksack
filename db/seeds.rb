# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
posts = Post.create([
  {
    title: "First Post!",
    subtitle: "Read about something.",
    content: "In the beginning the Universe was created. This has made a lot of people very angry and has been widely regarded as a bad move."
  },
  {
    title: "Invisibility & Impulses",
    subtitle: "An essay about the hidden world of design.",
    content: "The world of design is simultaneously simple and complicated."
  }
])
