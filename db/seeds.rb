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

# Next: 
# https://youtu.be/dOoHArAzdug (free dive from space)
# https://youtu.be/FAM1N1APk80 (maggie rogers debut)
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
# https://youtu.be/c0pS3Zx7Fc8
# https://youtu.be/Y2d2HLdBF88
# https://youtu.be/gpZeHFDPaxQ
# https://youtu.be/c_7_bQ7rAoc
# https://youtu.be/FqWgTM4di4s (slap chop)
# https://youtu.be/d6QXxMDp7Zg (278 days build a water park)
# https://youtu.be/DY_zyLEiNYk (OG Tony Robbins)
# https://www.youtube.com/watch?v=O5nskjZ_GoI&list=PL8dPuuaLjXtNlUrzyH5r6jN9ulIgZBpdo&index=3 (crash course in computer science... maybe used)
# https://www.instagram.com/reel/CRcTGsJpI_U/?utm_medium=copy_link (stop motion tiktok)
# https://youtu.be/NDW9zKqvPJI (Jocelyn Bell Burnell discovered pulsars)
# https://www.datcreativity.com/ (verbal creativity test) - game
# https://gail.com/ (gail dot come won't sell out)
# https://www.instagram.com/reel/CRrVb6bHzZG/ (virtual marble machine)
# https://www.usdebtclock.org/?fbclid=IwAR2ex31kGIAEjIRtwVCmecaumsmBeNjH1f4viVtjGFxG27rUxFAagX6ARAg (U.S. debt clock)
# https://direkris.itch.io/you-are-jeff-bezos (you are jeff bezos)
# https://youtu.be/SGUCcjHTmGY (openai's codex)
# https://jamesclear.com/goal-setting
# https://jamesclear.com/multitasking-myth
# https://www.instagram.com/p/CS4n9jygn1D/?utm_medium=copy_link
# https://oncyber.io/dwr
