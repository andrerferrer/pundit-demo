puts "Clean DB"

puts %{
   ___________________    . , ; .
  (___________________|~~~~~X.;' .
                        ' `" ' `
              TNT
}

User.destroy_all

puts "Create users"
User.create! email: "player@one.com", password: '123456'
User.create! email: "player@two.com", password: '123456'

puts "Create articles"
Article.create! title: "one article", body: 'With a nice body', user: User.first
Article.create! title: "Another article", body: 'With another nice body', user: User.second
