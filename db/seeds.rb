# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

##### Original seeds ----------------------

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

##### Additional seeds ----------------------

# 1 - learn 
# 2 - video 
# 3 - text 
# 4 - music
# 5 - game 

Link.create([{url: 'https://youtu.be/DY_zyLEiNYk', description: 'tony robbins sells cassettes', postDate: Date.parse('2021-07-16')}])
a2 = Link.last
a2.linktags.create(tag_id: 1)

Link.create([{url: 'https://www.instagram.com/reel/CRcTGsJpI_U', description: 'stop motion tiktok', postDate: Date.parse('2021-07-17')}])
a3 = Link.last
a3.linktags.create(tag_id: 2)

Link.create([{url: 'https://youtu.be/NDW9zKqvPJI', description: 'jocelyn bell burnell discovered pulsars', postDate: Date.parse('2021-07-18')}])
a4 = Link.last
a4.linktags.create(tag_id: 1)
a4.linktags.create(tag_id: 2)

Link.create([{url: 'https://www.datcreativity.com/', description: 'verbal creativity challenge', postDate: Date.parse('2021-07-19')}])
a5 = Link.last
a5.linktags.create(tag_id: 5)

Link.create([{url: 'https://gail.com/', description: 'gail won't sell', postDate: Date.parse('2021-07-20')}])
a6 = Link.last
a6.linktags.create(tag_id: 3)

Link.create([{url: 'https://www.instagram.com/reel/CRrVb6bHzZG/', description: 'virtual marble machine', postDate: Date.parse('2021-07-21')}])
a7 = Link.last
a7.linktags.create(tag_id: 2)
a7.linktags.create(tag_id: 4)

Link.create([{url: 'https://www.usdebtclock.org/?fbclid=IwAR2ex31kGIAEjIRtwVCmecaumsmBeNjH1f4viVtjGFxG27rUxFAagX6ARAg', description: 'usa debt clock', postDate: Date.parse('2021-07-22')}])
a8 = Link.last
a8.linktags.create(tag_id: 1)
a8.linktags.create(tag_id: 3)

Link.create([{url: 'https://jamesclear.com/goal-setting', description: 'goal setting', postDate: Date.parse('2021-07-23')}])
a9 = Link.last
a9.linktags.create(tag_id: 3)

Link.create([{url: 'https://direkris.itch.io/you-are-jeff-bezos', description: 'you are jeff bezos', postDate: Date.parse('2021-07-24')}])
a10 = Link.last
a10.linktags.create(tag_id: 5)
a10.linktags.create(tag_id: 1)

Link.create([{url: 'https://oncyber.io/dwr', description: '3d nft gallery', postDate: Date.parse('2021-07-25')}])
a10 = Link.last
a10.linktags.create(tag_id: 5)
a10.linktags.create(tag_id: 1)







# Link.create([{url: '', description: '', postDate: Date.parse('2021-07-14')}])
# Link.create([{url: '', description: '', postDate: Date.parse('2021-07-14')}])
# Link.create([{url: '', description: '', postDate: Date.parse('2021-07-14')}])
# Link.create([{url: '', description: '', postDate: Date.parse('2021-07-14')}])
# Link.create([{url: '', description: '', postDate: Date.parse('2021-07-14')}])
# Link.create([{url: '', description: '', postDate: Date.parse('2021-07-14')}])


# Next: 
# https://youtu.be/dOoHArAzdug (free dive from space)
# https://youtu.be/ZnZqB5Z75zI (Quicksilver)
# https://youtu.be/xh1ROLEDyP4 (eminem 8 mile)
# https://youtu.be/OacVy8_nJi0 (koyaanisqatsi final scene)
# https://youtu.be/SRwI3tgr3mQ (letterman and johnny depp)
# https://youtu.be/Rsy5u8LkP-Q (curb your flat earth)
# https://youtu.be/NWC5WWK7zI0 (teen saves friend with heimlich maneuver)
# https://youtu.be/69X7tP6p7E0 (dodgeball kill)
# https://youtu.be/M7FIvfx5J10 (van damme split) 
# https://youtu.be/TKRQBl8cap4 (bruce lee)
# https://youtu.be/jPAr3RpHugM (guy nails every accent)
# https://youtu.be/zw97LIBGbR4 (Shwarzenneger hit by an egg)
# https://youtu.be/GV6GgchU27M (drink glacier water)
# https://youtu.be/kxopViU98Xo (10hrs epic sax guy)
# https://youtu.be/EsWHyBOk2iQ (will ferrell and chad smith)
# https://bongo.cat/ (bongo cat) 
# Cows and music 
# No Country for Old Men 
# https://twitter.com/TechEmails/status/1413534752699830275
# https://twitter.com/TechEmails/status/1409916451729940480
# https://twitter.com/TechEmails/status/1407016788240576512
# https://youtu.be/FqWgTM4di4s (slap chop)
# https://youtu.be/d6QXxMDp7Zg (278 days build a water park)
# https://www.youtube.com/watch?v=O5nskjZ_GoI&list=PL8dPuuaLjXtNlUrzyH5r6jN9ulIgZBpdo&index=3 (crash course in computer science... maybe used)
# https://youtu.be/SGUCcjHTmGY (openai's codex)
# https://jamesclear.com/multitasking-myth
# https://www.instagram.com/p/CS4n9jygn1D/?utm_medium=copy_link
