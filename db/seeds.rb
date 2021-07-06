# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 1 - learn 
# 2 - video 
# 3 - text 
# 4 - audio 
# 5 - game 

# Link.create([{url: 'https://youtu.be/dNJdJIwCF_Y', description: 'fresh guacamole by PES', postDate: Date.parse('2021-06-17')}])
# Link.create([{url: 'https://patrickcollison.com/fast', description: 'patrick collison fast', postDate: Date.parse('2021-06-18')}])
# Link.create([{url: 'https://jgthms.com/web-design-in-4-minutes/', description: 'web design in 4 minutes', postDate: Date.parse('2021-06-19')}])
# Link.create([{url: 'https://vimeo.com/58659769', description: 'the scared is scared', postDate: Date.parse('2021-06-20')}])
# Link.create([{url: 'https://www.lightnote.co/', description: 'how music works', postDate: Date.parse('2021-06-21')}])
# Link.create([{url: 'https://youtu.be/UGUu7qhGh_k', description: 'when spongebob is life', postDate: Date.parse('2021-06-22')}])
# Link.create([{url: 'https://youtu.be/Py805hYfopw', description: 'clumsy reporter knocks down jenga tower', postDate: Date.parse('2021-06-23')}])
# Link.create([{url: 'http://links.net/vita/', description: 'the first blog on the web, since 1994', postDate: Date.parse('2021-06-24')}])
# Link.create([{url: 'https://youtu.be/IvUU8joBb1Q', description: 'wintergatan marble machine', postDate: Date.parse('2021-06-25')}])
# Link.create([{url: 'https://youtu.be/NgjmISsxsMI', description: 'horse hoof restoration', postDate: Date.parse('2021-06-26')}])
# Link.create([{url: 'https://www.susanrigetti.com/physics', description: 'so you want to learn physics', postDate: Date.parse('2021-06-27')}])

# Tag.create([{tagName: "learn"}, {tagName: "video"}, {tagName: "text"}, {tagName: "audio"}, {tagName: "game"}])

# Link.find(1).linktags.create(tag_id: 2) 
# Link.find(2).linktags.create(tag_id: 1) 
# Link.find(2).linktags.create(tag_id: 3) 
# Link.find(3).linktags.create(tag_id: 1) 
# Link.find(3).linktags.create(tag_id: 3) 
# Link.find(3).linktags.create(tag_id: 5) 
# Link.find(4).linktags.create(tag_id: 2) 
# Link.find(5).linktags.create(tag_id: 1) 
# Link.find(5).linktags.create(tag_id: 4) 
# Link.find(5).linktags.create(tag_id: 5)
# Link.find(6).linktags.create(tag_id: 2)
# Link.find(7).linktags.create(tag_id: 2)
# Link.find(8).linktags.create(tag_id: 3)
# Link.find(9).linktags.create(tag_id: 2)
# Link.find(9).linktags.create(tag_id: 4)
# Link.find(10).linktags.create(tag_id: 1)
# Link.find(10).linktags.create(tag_id: 2)
# Link.find(11).linktags.create(tag_id: 1)
# Link.find(11).linktags.create(tag_id: 3)