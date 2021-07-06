# README

# Not sure where these go yet, but important: 

- Small things like the difference between '<% yield %>' and '<%= yield %>' are crucial to success as a developer. Attention to detail. In the above case, either everything appears or nothing appears. Big difference.
- What is the role of postgres on my local computer? Not sure it's entirely needed. 
- What configuring do I need to do with the env variable $PORT? What is it?

## Notes for the reader

- I use `onelinktrta` everywhere when referring to my app, because that's the name of the one I created. You choose a different name! 
- Note that when I include `$` at the start of a piece of code, that indicates a command in Terminal. Example: `$ git init` is this: 

[Picture]

–––––––––––––––––––––––––––––––––––––––––––

# Steps to victory
1. Set up dev environment & VS Code on a new computer. (outlined)
2. Create a Rails app locally, connect to Github. (outlined)
3. Deploy it to Heroku. (outlined)
4. Initialize a database on Heroku, seed it and display live data. 
5. Create join table & unique pages for each tag. 
6. Set up a local environment & seed.
7. Add minimal CSS. (outlined)
8. Connect app to a custom domain. (outlined)

––––––––––––––––––––––––––––––––––––––––––––

# 1. Set up environment & VS Code on a new computer

My computer specs: 
- Macbook Air
- MacOS Catalina 10.15.7
- Google Chrome

## Downloads
- Homebrew (code library installer)
- Git (version control)
- Ruby (language)
- Gem (code library installer for Ruby)
- Rails (web framework using Ruby)
- Javascript (language)
- NPM (code library installer for Javascript)
- VS Code (editor)
- VS Code plug-ins (coding efficiency)
- Postgres (local database)

## Relevant websites
- Github (code storage)
- Heroku (code deployment)

## Links for each
- Learn.co link (what I used at Flatiron, a process that should be open sourced)
- brew install ruby, etc. ^^
- Just write it all down here

## Odd errors solved
* There is a `gem` called `yarn` (deprecated and irrelevant) and there is a `node package` also called `yarn` (the one we want). For a while I was receiving error message: `ERROR MESSAGE HERE` and only figured things out by going to this `STACK OVERFLOW RESPONSE` [Link] 
- The key was: delete the gem. Re-install the node package. To check this use `THIS In TERMINAL`

* If you have 2FA, linking up to Github can cause issues. EXPLAIN ISSUE HERE, If I CAN REMEMBER. 

- how do we know if everything is working correctly? What's the smoke test? JACKSON TO FIGURE OUT.

––––––––––––––––––––––––––––––––––––––––––––

# 2. Create a Rails app locally, connect to Github
- Guide to rails [link]

- Move to your desktop or wherever you want to save the app: `$ cd desktop` 

- `$ rails new onelinktrta --database=postgresql`
- Don't forget `--database=postgresql`; SQLite is your default database. That's not an issue if you're just running the app on your own computer (i.e. a game on your Terminal). But it is an issue if you eventually want to send your app up to Heroku and deploy it on the web. Heroku uses postgres, so use postgres.
- Move into the newly made Rails app directory: `cd onelinktrta`
- Spin up git version control: `git init`
- then the classic of: 
    1. `$ git status` (checks for changes)
    2. `$ git add .` (stages the changes) 
    3. `$ git commit -m "first message` (commits changes) 
    - You now have an app that exists in code on your computer and has version control. 
- To test that it's working cd in and use `rails s` to spin up a local server. If puma, yarn and everything else is installed correctly, then you should see the classic default Rails page. 

[Picture]

Nice. Now, let's change that page info to something more appopriate. In Views (page displays), go to Application.html.erb and write in a header: 

```
<h1>onelinktrta</h1>
<h3>what's good about the internet</h3>

```

- Reload your server e.g.local.3000.
- If the changes are reflected, you know you have a working Rails app. Let's link the app up to Github to save the code in the cloud for free.

- GITHUB link to get things setup.
- Note about 2FA. 

Once you see the README.md appear like so, you're good to go: 

[Picture]

To triple check, Change the README.md to say: 

```
Hello world.
```
1. `$ git status` (checks for changes)
2. `$ git add .` (stages the changes) 
3. `$ git commit -m "first message` (commits changes) 
4. `$ git push -u origin main`

If you see `Hello world` as the text now in your README on Github, you're good to go. 

––––––––––––––––––––––––––––––––––––––––––––

## 3. Deploy the app to Heroku.

Heroku guide to Rails 6.X [Link]

You have a Rails app. That Rails app is not Heroku-ready as is. Here's what to expect: 

- Add a `Procfile`
    - What is a procfile? [Link] A Heroku-specific document describing how Heroku should spin up your app.
- Change the database to postgres with the correct $PORT. 
- Log in to Heroku [Link]
- Connect CLI [Link]
- Create a new Heroku app [Link]
- Add a new remote origin for `/onelinktrta` (your Rails app) i.e. you will be sending your code to a custom version of Github that Heroku maintains. They will store your code. From this point on you'll push your code to both Github and Heroku. 
- OTHER THINGS I FORGET. 

––––––––––––––––––––––––––––––––––––––––––––

## 4. Initialize a database with join table on Heroku, seed it. 

Steps: 
1. Use Rails models generators (cookie-cutter code) that creates database migrations, models, controllers and schema.
 
- Initialize a database (local) 
- Initiatize tables (local)
- Initialize & migrate tables in heroku production. (remote)
- Access the console. (remote)

I'm creating an app that posts one link per day. Each of those links can have multiple tags. I imagine just three tables: 1) Links, 2) Tags, 3) Links & Tags Join Table.

What's a join table [Link]
Grammatical standards [Link] - need the actual phrase

The tables we want:
- Seed with all the correct data. 
    The correct data, Table Links:
        - link:string 
        - postDate: date
        - timestamps
        - title:string (may or may not use)

    (optional) The correct data, Table TagsLinks:
        - FK:link
        - FK:tag
        - timestamps
    (optional) The correct data, Table Tags: 
        - tagName:string
        - timestamps

- The above will give me step 1) a list of links postable by date and 2) the possibility of tagging.

With all that info, you can create a pretty nice little system. Fairly robust. Just need to figure out how to do this database migration. Going to read a few articles first. At the moment, just looking at the Rails Heroku page and the Rails Getting Started page. The Getting started page is optimized for a local environment so just want to be sure. Medium article time.

- Okay... so interesting. Just remembering the flow of things and what's required when doing database stuff. You start by creating a migration file. `rails generate model Link name:string` etc
- BUT I forgot that the table name is supposed to be plural.
- Wait wait wait no I did it correctly. You generate with singular in the terminal and then rails automatically get you ready to migrate in a plural table.
- Creating a join table `https://dev.to/neshaz/join-table-in-rails-23b5`
- And a little bit of this `https://stackoverflow.com/questions/17765249/generate-migration-create-join-table`


- Okay, I went ahead and generated three models. The models will connect to three tables. The ones outlined above. Models were created. I had to manually modify them to add the joining relationship (`has_many` and `belongs_to`). And three migration files were automatically created. Next up is migrating all these bad boys in Heroku.
- Wait no not yet. First I need to take those files which i've created on my local computer and send them up to the Heroku dyno. `git add .` `git commit -m "models and migrations` `git push -u heroku main`
- now the code exists on the dyno and I can safely db:migrate. Let's do it `heroku run rake db:migrate`
- there is an SQLite file that is lingering, which is interesting.
- Okay I ran the migration. Everything SHOULD be up and running and it appears to be successful. Time to play around in the console.
- Time to create some data... `heroku pg:psql` - this allows me to access the console.
- Interesting, so now I have access to the datbase directly. But is that what I want? I'd rather access the console and create things via Link.new(). I want to go entirely through ActiveRecord speak. Ah okay -- `heroku run rails console` is what I need. I don't want to use SQL. I want ActiveRecord. Okay okay okay here we go great. 

- Alright, we're now in the console creating shit. ```Link.new(url: "https://wwww.youtube.com/watch?v=dQw4w9WgXcQ", description: "rick roll'd", postDate: Date.parse('2021-06-16'))```
- Created our first record. Let's now display this thing. Working through the rails documentation, I then saved the new initialized object to the database and found it again via id. `link1.save` then `Link.find(1)` And there it is with its timestamps, etc. Game on. 

OKAY NEXT PHASE, display the data.

––––––––––––––––––––––––––––––––––––––


## 5. Display live data. 

- We're entering the controller / view / erb area. I remember this, but only kind of. The key here is that to display things, you use `@`. That variable is the shared value between controller and view. Let's just do this thing.
- One issue I have now is that my controller is called "ArticlesController" but it should really be "LinksController" ––– I'll fix that in a bit. Eager to just see things appear on the page.
- Going to do this: `@first_link = Link.find(1)`
- Then going to reach inside that thing and pull out the url in views, I suppose. Interesting how the views handles an OBJECT. Seems like a bit of magic going on there.
- Okay, I've added this `<%= first_link.url %>` to my index page. Let's see what happens. Theoretically, this should work! 
- Nope... got over excited. It does not work. It compiled. Reloaded the page... then nothing.
here's the error message `at=info method=GET path="/" host=onelinktrta.herokuapp.com request_id=a08bb9d7-19aa-4dc6-9152-23a9878dce4e fwd="72.130.33.132" dyno=web.1 connect=1ms service=137ms status=500 bytes=1827 protocol=https` Which to me means I requested the page and there was a server error (500)... but nothing is specified. Ah, I see... I think. I didn't add `@` before first link above. But i'm not sure why that would constitue an issue? Maybe `Link.find(1)` isnt' correct? I did go off script there. 

- From the rails site: `The <%= %> tag means "evaluate the enclosed Ruby code, and output the value it returns."` So I'm assuming that the enclosed Ruby code just couldn't be evaluated without the `@`... Let's hope. 

- That was it! 

Alright, we've now displayed data from a database hosted by Heroku!

Now it'd be great to seed this thing with the correct data and display each link properly. Shouldn't be too hard.

Seeding a rails database is not part of the "getting started" article.
- `heroku run rake db:seed`
From: https://stackoverflow.com/questions/23233414/heroku-how-to-push-seeds-rb-to-existing-rails-app
And: https://ninjadevel.com/seeding-database-ruby-on-rails/

- Fun, fun. I seeded everything with `date` instead of `postDate` for each Link. Attempt #2 let's go.
- okay, so things have deployed to heroku. Now time to seed this baby.


Alright... what's done is done. I ended up displaying them in the wrong chronological order. Add a little `.reverse` method and we're golden. I also like that the new formatting is of type `2021-06-12` as opposed to `june 12 2021` –– that'll be better categorization long-term.

Adding a new day to the mix... 

`Link.create([{url: 'https://nandgame.com/', description: 'learn to build a computer from scratch', postDate: Date.parse('2021-06-29')}])`

––––––––––––––––––––––––––––––––––––––––––––––––

# Tags (join table)

Seed a bunch of tags... (did this directly in the rails console, but could've seeded.)s

Tag.create([{tagName: 'learn'}, {tagName: 'video'}, {tagName: 'text'}])
LinkTag.create({link_id: 1, tag_id: 2})

Okay, interesting. I think I named things incorrectly. Here's the error I'm getting: 
`uninitialized constant Link::Linktag (NameError)` So let's change that. Because it's not picking up that there's a table called LinkTag.

Oh GOD. I have to rename things. What a pain.

Okay I'm adding `class: LinkTag` to specify things... hopefully that works. pushed that up to main. Awaiting the verdict. `heroku run rails console`

BOOM. It's working. Tested with: 

`first = Link.first`
`first.linktags`
`first.tags`

Unitialized constant error in Ruby: https://www.thoughtco.com/nameerror-uninitialized-2907928

Nice. It now also is displayed on the web. 

Shortcut to making new join table entries: 
`Link.find(x).linktags.create(tag_id: y)`
Will use this now to seed.

I want to change the meaning of the tag "learn" to be *you actually learn a skill by the end of it* not just "I've seen something new" or "I'm reading new knowledge"... 

`LinkTag.find(x).destroy` – about to do a few of these in the console.
Thanks Stack Overflow: https://stackoverflow.com/questions/7069221/delete-a-record-from-console-ruby-on-rails

Finding all tags for a particular link id: `LinkTag.where(link_id: xy)`

Alright, all of the tags are appropriately displaying.

In the interest of creating something simplified, I'm going to stop rendering tags alongside each entry. Each entry should be unique. These tags are classifiers. They should be their own categories on the page. I.e. at the top of the page, or bottom, you click "game" or "learn" and it auto-sorts to that.

Removing the tags for now, then we'll 

Next steps until I feel like we'll have a pretty decent, basic app pre-JS. 
1. Category pages. `/video` `/text` etc. 
2. A home page that only shows one link, then an archive page that shows everything.
3. Set up testing environment. 
4. Custom domain.

Future add-ons / articles:
1. Display total clicks for each link with real-time change. 
2. 3 different style pages. 
3. Admin page with authentication (Google?) 
4. Mailer so that people can suggest links to me via email. (which I know absolutely nothing about.)

... you can pretty much get endless with thing. It's my version of a blog. New and links from the web all the time.


–––––––––––––––––––––––––––––––––––––––––

## Creating Routes in Rails

- Conceptually, we're going from routes to controller to sending out a view, which may or may not be relying on a model? Depends on if you're engaging with database. 

Following guidelines here: https://guides.rubyonrails.org/routing.html

Okay, I'm rusty as heck on SQL and that general flow of getting data from the db. What I need to is to get all links that are of a certain category. 

I'm going to go through the join table first to get this info. I'll get an array of values and use those.
1. In LinkTags, get all values where the id is `2` (video)
    
2. Make an array of all of those link_id values. 
    `video_linktags = LinkTag.where(tag_id: 2)`
3. One by one, gather all of the links associated in an array.

Where tf do I put the method above?

```
video_linktags.each do |vl|
    Link.find(vl.link_id)
end
```

And I can make this all one method by doing this: 

LinkTag.where(tag_id: 2).each do |vlink|
    Link.find(vlink.link_id).url
end

I know I shouldn't be processing all this on the front. These methods should be kept on the backend... but I am curious to see if it's the right idea. I'll hide it in models in a second.

```
<% LinkTag.where(tag_id: 2).each do |vlink| %>
      <a target="_blank" href=<%= Link.find(vlink.link_id).url %>> <%= Link.find(vlink.link_id).postDate %></a>&nbsp <span style="font-size:10px;"><%= Link.find(vlink.link_id).description %></span>
  <% end %> 
```

Lol the app crashed. Okay, clearly I can't evaluate things on the front end. Need to put things away in controllers.

Okay, added this to my controller:
```
@video_objects = []
LinkTag.where(tag_id: 2).each do |vlink|
    @video_objects.push(Link.find(vlink.link_id))
end
```

And this to my html:
```
<% @video_objects.reverse.each do |video_object| %>
      <a target="_blank" href=<%= video_object.url %>> <%= video_object.postDate %></a>&nbsp <span style="font-size:10px;"><%= video_object.description %></span><br>
    <% end %>
```

And that worked. 
Let's figure out how to create a new route at `/video` that shows just this data. 

Create a new route page.

Adding this info
```
def index
    @first_link = Link.find(1)
    @links = Link.all  
  end

  def video
    @video_objects = []

    LinkTag.where(tag_id: 2).each do |vlink|
      @video_objects.push(Link.find(vlink.link_id))
    end
  end
```

And created a new page 
`video.html.erb`

hoping that that's all I need to do 
I also did this in routes: 

`get "/video", to: "articles#video"`

Fingers crossed that's all we need! 
- A change to controller (which contains the code to contact our db, I suppose -- although I feel like that should be in model? hmm.)
- A new view page in the articles folder. 
- A new route in the config file `routes.rb`

Sick! That worked. Okay, okay, okay. This is good.

We'll just copy this code 5 times. One for each category. And the home page will be blank except for the most recent link. This is great. Home stretch of the site features as a whole.

Okay.. loading up all the rest here. Let's see if they work.

Ah, I didn't change the logic. Need to go back and pull the correct id from the db.

- Change the db values. (done)
- Find an interesting way to render the category listings. (done)
- Remove underline from link in header. (done)



# Setting up a local environment 

1. I hit `heroku local` and received a NoDatabaseError
2. I went here https://stackoverflow.com/questions/34203765/activerecordnodatabaseerror-fatal-database-db-development-postgresql-does-n and followed the top suggestion. Somehow (not sure how) I already have postgres ready to go on my comp so hitting `rake db:create && rake db:migrate` works.
3. I hit `heroku local` again and ran into a `NoMethodError in Articles#index` with the key msg being: `undefined method 'url' for nil:NilClass` I'm assuming this just means that the datbase is initialized with nothing in it, so there's no method-ing that can be done. Let's seed the thing.
4. Uncommented the following in seed.rb:

```
Link.create([{url: 'https://youtu.be/dNJdJIwCF_Y', description: 'fresh guacamole by PES', postDate: Date.parse('2021-06-17')}])
Link.create([{url: 'https://patrickcollison.com/fast', description: 'patrick collison fast', postDate: Date.parse('2021-06-18')}])
Link.create([{url: 'https://jgthms.com/web-design-in-4-minutes/', description: 'web design in 4 minutes', postDate: Date.parse('2021-06-19')}])
Link.create([{url: 'https://vimeo.com/58659769', description: 'the scared is scared', postDate: Date.parse('2021-06-20')}])
Link.create([{url: 'https://www.lightnote.co/', description: 'how music works', postDate: Date.parse('2021-06-21')}])
Link.create([{url: 'https://youtu.be/UGUu7qhGh_k', description: 'when spongebob is life', postDate: Date.parse('2021-06-22')}])
Link.create([{url: 'https://youtu.be/Py805hYfopw', description: 'clumsy reporter knocks down jenga tower', postDate: Date.parse('2021-06-23')}])
Link.create([{url: 'http://links.net/vita/', description: 'the first blog on the web, since 1994', postDate: Date.parse('2021-06-24')}])
Link.create([{url: 'https://youtu.be/IvUU8joBb1Q', description: 'wintergatan marble machine', postDate: Date.parse('2021-06-25')}])
Link.create([{url: 'https://youtu.be/NgjmISsxsMI', description: 'horse hoof restoration', postDate: Date.parse('2021-06-26')}])
Link.create([{url: 'https://www.susanrigetti.com/physics', description: 'so you want to learn physics', postDate: Date.parse('2021-06-27')}])

Tag.create([{tagName: "learn"}, {tagName: "video"}, {tagName: "text"}, {tagName: "audio"}, {tagName: "game"}])

Link.find(1).linktags.create(tag_id: 2) 
Link.find(2).linktags.create(tag_id: 1) 
Link.find(2).linktags.create(tag_id: 3) 
Link.find(3).linktags.create(tag_id: 1) 
Link.find(3).linktags.create(tag_id: 3) 
Link.find(3).linktags.create(tag_id: 5) 
Link.find(4).linktags.create(tag_id: 2) 
Link.find(5).linktags.create(tag_id: 1) 
Link.find(5).linktags.create(tag_id: 4) 
Link.find(5).linktags.create(tag_id: 5)
Link.find(6).linktags.create(tag_id: 2)
Link.find(7).linktags.create(tag_id: 2)
Link.find(8).linktags.create(tag_id: 3)
Link.find(9).linktags.create(tag_id: 2)
Link.find(9).linktags.create(tag_id: 4)
Link.find(10).linktags.create(tag_id: 1)
Link.find(10).linktags.create(tag_id: 2)
Link.find(11).linktags.create(tag_id: 1)
Link.find(11).linktags.create(tag_id: 3)
```

5. `rake db:seed` and good to go. Now at `http://0.0.0.0:5000/` I see the app.
6. Test that the test is working by clicking through the links. Yes, it works.
7. I had a mix-up in the dates. Going to hop my butt into the local heroku console and change some values. `heroku local:run rails console` (https://devcenter.heroku.com/articles/heroku-local) And the order of operations from this https://stackoverflow.com/questions/12329687/how-to-update-value-of-a-models-attribute: 


```
collison = Link.find(2)
collison.postDate = Date.parse('2021-06-18')
collisonl.save
``` 

8. Spin up `heroku local` again... and *interesting* - things changed. The order of the page is all wrong. I don't think it's ordering based on IDs. Must be ordering based on last updated? Okay, yes. Naturally the db orders by last updated entry. 
9. Adding `.order(:id)` to my definitions in the controller
10. Small hack to speed up development: have two terminals open. One has access to the rails console. The other has spun up the local environment.
11. Moving things around and adding styling, because it's working. 

https://stackoverflow.com/questions/10845517/how-to-change-the-link-color-in-a-specific-class-for-a-div-css

And testing out styling with links: https://yourbusiness.azcentral.com/clear-links-visited-pages-6860.html


## 7.  Add minimal CSS
No use in belaboring this section. The site is extremely simple. Just wanted basic spacing. In the future, I may return to this page and include a number of other designs.

```
body { 
padding-left: 30px;
}

h2 {
padding: 0px;
margin-top: 0px;
margin-bottom: 5px;
}

.navigation {
    font-size: 10px;
    padding: 3px;
}
```


–––––––––––––––––––––––––––––––––––––––––––


## 8. Connect a custom domain

> Tripped me up: Heroku says you can link up custom domains on the Free tier. This is true, to an extent. You can link up an `http` unsecure custom domain for free and easily. But in order to secure your site with `https`, you need to either a) upgrade to Hobby plan at $7/mo or b) go through the process of obtaining a certificate manually through Let's Encrypt [link]. I didn't have the patience to go through Let's Encrypt and went with the easy option of paying for the Hobby tier. 

Steps:
- Buy a custom domain via Google.
- Upgrade Heroku to Hobby ($7/mo) to auto-manage https.
- Connect custom domain to Heroku app.

Articles:
- (Most helpful) https://nikodunk.com/heroku-ssl-google-domains-2019/
- https://devcenter.heroku.com/articles/custom-domains

Buy domain, connect to app:
- `domains.google.com` > `onelinktrta.com` > add to cart > pay for it.
- You now own the root domain `onelinktrta.com`. Google hosts it for a yearly fee.
- Back to onelinktrta app in Heroku > Settings > Add Domain > `www.onelinktrta.com`
- Heroku provides a `DNS Target` - copy that.
- `domains.google.com` > My domains > onelinktrta.com > DNS
- Add a custom resource record > www | CNAME | 1hr | _DNS Target from Heroku_

> In a second, your page will be available on the web, but via unsecure `http` not the secure `https` which is standard/necessary. Visit `http://www.onelinktrta.com` on your phone browser. Your site should come up immediately. I used my phone because Google Chrome on my desktop kept automatically rerouting me to the `https`, which sent back a page connection error, because I hadn't yet setup `https`.

Go from http (unsecure) to https (secure): 
- In Heroku `onelinktrta` > Resources > Change Dyno Type > Hobby.
- Settings > "Your certificate is automatically managed." 
- Visit `https://www.onelinktrta.com` - Done. No configuration required.

Setup domain forwarding:
- Visit `https://onelinktrta.com/`. Nothing comes up.

In the end, the following domains all lead to `www.onelinktrta.com`:
- `https://www.onelinktrta.com`
- `https://onelinktrta.com`
- `http://www.onelinktrta.com`
- `http://onelinktrta.com`

Follow Niko's instructions: 
- From onelinktrta.com
- To: https://www.onelinktrta.com
- BLANK SHOULD BECOME BLANK
- Permanent redirect (301).
- SSL enabled.

Two errors I ran into:

1. An endless error in Google Domains asking me: "Do you want to replace the records?" Solved by removing `www.onelinktrta.com` as a domain in the "from" field (it was was added automatically?). 

2. After correctly setting up domain forwarding, there was a period where I still was not able to reach `https://onelinktrta.com`. Receiving this error in the browser:

[Picture]

And this one in the Google Domains DNS dashboard:

```
This synthetic record has an error and will not function correctly:
The SSL Certificate for this domain hasn't been created yet. This process may take up to 24 hours to complete.
```

I initially tried changing the domain forwarding from `301` to `302` (temporary), assuming from this article [https://webmasters.stackexchange.com/questions/85519/can-i-configure-google-domains-to-redirect-a-bare-domain-to-a-subdomain-over-htt] that I was just waiting for the changes to propagate over the Internet.

Everything seems to be hung up on the fact that I don't have an SSL certificate readily available for Google to confirm. But... I definitely do. Visible thorugh Heroku so. I'm not sure.

- Solved, again, by testing via my phone. I searched `onelinktrta.com` on my phone and it forwarded _correctly_ to `www.onelinktrta.com` ... but with an alert symbol in the url bar warning about no security / SSL certificate.
- Then typed in `http://onelinktrta.com` and it worked, correctly sent to `https://www.onelinktrta.com`. Perhaps a browser caching issue? Not sure.
- Immediately thereafter, errors are resolved on desktop and everything works.


Further reading / questions:
- What is the manual process for Let's Encrypt + certbot?
- Static IP vs Dynamic IP (re: Heroku)

––––––––––––––––––––––––––––––––––––––––––––––


Other articles:
- https://devcenter.heroku.com/articles/automated-certificate-management
- https://stackoverflow.com/questions/67243264/heroku-with-lets-encrypt-couldnt-find-that-sni-endpoint.
- Heroku + Let's Encrypt: https://certbot.eff.org/hosting_providers. Heroku is partial.
- Certbot: https://medium.com/@bantic/free-tls-with-letsencrypt-and-heroku-in-5-minutes-807361cca5d3
- SSL is not necessarily a paid certificate, but there are clear advantages: https://sslrenewals.com/blog/difference-between-free-ssl-certificate-and-paid-ssl-certificate 
- Certbot + Let's Encrypt pretty confusing at the jump. Inclined to just pay?
- https://devcenter.heroku.com/articles/ssl
- Heroku uses dynamic, rather than static IP. Worth reading about. [Link]