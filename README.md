# README

# Overview

> It's been nearly 2 years since I opened up my coding editor. New computer and can't even remember how to navigate in the Terminal. I'm recording this process for my future self so that when I inevitably forget again how to do this, I've got the right set of resources in one place.

## Goal

Build a simple Rails app through Heroku that utilizes a join table and is hosted on a custom domain.

## Notes for the reader

- I use `onelinktrta` everywhere when referring to my app, but you choose a different name! 
- Note that when I include `$` at the start of a piece of code, that indicates a command in Terminal. Example: `$ git init`. 
- To speed up development, open two terminals. One to run the server and one to access the console.

[Picture]

–––––––––––––––––––––––––––––––––––––––––––

# Steps to victory
1. Set up dev environment & VS Code on a new computer. (outlined)
2. Create a Rails app, connect to Github. (outlined)
3. Deploy it to Heroku. (outlined) 
4. Create a database on Heroku, display live data. (outlined)
5. Create join table, seed and display data. (outlined)
6. Create unique routes with join table. (outlined)
7. Set up and seed local environment. ()
8. Add minimal CSS. (outlined)
9. Connect app to a custom domain. (outlined)

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

## Links for each
- Learn.co link (what I used at Flatiron, a process that should be open sourced)
- brew install ruby, etc. ^^
- Just write it all down here

```
- brew... 
- git etc.
- 
```

## Relevant websites
- Github (code home)
- Heroku (code storage & deployment)

## Odd errors solved
* There is a `gem` called `yarn` (deprecated and irrelevant) and there is a `node package` also called `yarn` (the one we want). For a while I was receiving error message: `ERROR MESSAGE HERE` and only figured things out by going to this `STACK OVERFLOW RESPONSE` [Link] 
- The key was: delete the gem. Re-install the node package. To check this use `THIS IN TERMINAL`

* If you have 2FA, linking up to Github can cause issues. EXPLAIN ISSUE HERE, If I CAN REMEMBER. 

- how do we know if everything is working correctly? What's the smoke test? JACKSON TO FIGURE OUT.

––––––––––––––––––––––––––––––––––––––––––––

# 2. Create a Rails app, connect to Github
- Guide to rails [link]

- Move to your desktop or wherever you want to save the app: `$ cd desktop` 

- `$ rails new onelinktrta --database=postgresql`
- Don't forget `--database=postgresql`; SQLite is your default database for local operations, but Heroku uses Postgres.
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

Change the README.md to say: 

```
Hello world.
```
1. `$ git status` (checks for changes)
2. `$ git add .` (stages the changes) 
3. `$ git commit -m "first message` (commits changes) 
4. `$ git push -u origin main`

If you see `Hello world` as the text now in your README on Github, you're good to go. 

––––––––––––––––––––––––––––––––––––––––––––

# 3. Deploy it to Heroku

Heroku guide to Rails 6.X [Link]

You have a Rails app. That Rails app is not Heroku-ready as is. Here's what to expect: 

- Add a `Procfile`
    - What is a procfile? [Link] A Heroku-specific document describing how Heroku should spin up your app.
- Change the database to postgres with the correct $PORT. 
- Log in to Heroku [Link]
- Connect CLI [Link]
- Create a new Heroku app [Link]
- Add a new remote origin for `/onelinktrta` (your Rails app) i.e. you will be sending your code to a custom version of Github that Heroku maintains. They will store your code. From this point on you'll push your code to both Github and Heroku. 

––––––––––––––––––––––––––––––––––––––––––––

# 4. Create a database on Heroku, display live data

Steps: 
1. Create a model, db migrations + associated controller with a generator.
2. Send that code to Heroku.
3. Initiate the db, migrate in table. 
4. Create first db record from Heroku console.
5. Display the first record live on the site.

## 1. Model, migrations, controller

- `$ rails generate model Link url:string description:string postDate:date` 
> You just created a model file, controller and db migration. The table looks like so:
```
id | url | description | postDate | created_at | updated_at
```
> Note: use the singular "Link" and not "Links" for model generators.

## 2. Send that code to Heroku.

- `$ git add .`
- `$ git commit -m "link table"`
- `$ git push -u origin main`
- `$ git push -u heroku main`

## 3. Initiate the db, migrate in table. 

- `$ heroku run rake db:migrate`
> You just created the postgres database and the tables on Heroku's servers.

## 4. Create the first db record from Heroku console. 
- `$ heroku run rails console`
> SMOKE TEST
- `$ Link.all` 
```
output: [should say nothing]
```
- `$ Link.create({url: "https://rickrolld.com", description: "rick", postDate: "2021-07-10"`
> DID IT WORK?
- `$ Link.first`
```
[output]
```

If I really wanted to, I could access the heroku datbase directly in Terminal with `heroku pg:psql`. Then I'd have to use SQL to create records. Not useful for me, since I also want to play around with Ruby methods while accessing the data from the db. So only need the Heroku / Rails console.

At this point, we've created a rails app, deployed it to Heroku, created a database through Heroku and the first line of data in that database. Time to display that line of data on the actual site.

> An SQLite lingers in my Rails app, which is interesting. Feel free to delete it for visual cleanliness. 

## 5. Display the first record live on the site.

> views, ERB, controller.

- In `[index_controller.rb]` add the method: 
```
Def index
 `@first_link = Link.find(1)`
end
```

> This is a variable value that is now available to the 'index' page, which is your index.html.erb.

- Move to `application.html.erb`
- Add to the top: `<a href=<%= @first_link.url %>><%= @first_link.description %></a>`
> Thanks to the controller, @first_link is available to display. In the case above, we'll see clicking "rick" leads you to the all-time video. 

- `$ git add .`
- `$ git commit -m "viewable data"`
- `$ git push -u origin main`
- `$ git push -u heroku main`

Reload the page and you should see a link to the YT video from the text "rick". 

> Key: '@' bridges the gap bw controller and html(.erb), your views. The whole thing crashes if you don't add '@' in the .html.erb file.

> One interesting thing - not sure if it's an issue... My controller is called "ArticlesController" but shouldn't it really be called "LinksController" ––– Will fix in a bit. Not causing any problems and eager to see data appear.

–––––––––––––––––––––––––––––––––––––––––––

# 5. Create join table, seed and display data.

The ultimate goal of this app is for it to both see what link is posted _today_ as well as an index of _past links_ grouped by category. In order to group links by category, we need to create a join table.

- What's a join table [Link]
- Standard Rails syntax [Link]
- Creating a join table `https://dev.to/neshaz/join-table-in-rails-23b5`
- And a little bit of this `https://stackoverflow.com/questions/17765249/generate-migration-create-join-table`

Steps: 
1. Create two more models with db migrations + controller.
2. Modify the models to create join table relationships.
3. Send that code to Heroku & migrate in the new tables. 
4. Create first relational record from Heroku console.
5. Display the first relational record live on the site.
6. Seed a database with more links and tags.

## 1. Create two more models with db migrations + controller.

- `$ rails generate model Tag tagName:string` 
- `$ rails generate model LinkTag tag:references link:references`

2 tables created:

```
[Table name: Tags]

id | tagName | created_at | updated_at
```

```
[Table name: LinkTags]

id | t_links | t_tags | created_at | updated_at
```

## 2. Modify the models to create join table relationships.

- In your models, copy these:

```
has_many

belongs_to

class_name: "LinkTag"
``` 

> If you don't add 'class_name: "LinkTag", then you'll get this error: 'uninitialized constant Link::Linktag (NameError)'. This means it's not picking up that there's a table called LinkTag.
Unitialized constant error in Ruby: https://www.thoughtco.com/nameerror-uninitialized-2907928

> The above creates the relationships between tables. 

You now have 2 new tables, one of which is a join table that relates the two other tables together. 

## 3. Send that code to Heroku & migrate in the new tables.

- `$ git add .`
- `$ git commit -m "viewable data"`
- `$ git push -u origin main`
- `$ git push -u heroku main`

- `heroku run rake db:migrate`

## 4. Create first relational record from Heroku console.


- Create a tag: `Tag.create({tagName: "video"})`
- Join tag to the first link: `Link.find(1).linktags.create(tag_id: 1)`

// SMOKE TEST

- `Link.first.linktags`
If you see: 
```
The Tag object 
```

Then the two tables are correctly created + the relationships between them are correctly setup.

## 5. Display the first relational record live on the site.

- In `articles_controller` add the method:

```
def index
    @first_link = Link.last
    @first_link_first_tag = first_link.linktags.first
end`
```

- Move to `index.html.erb` and add a function that displays info from `@first_link_first_tag `.

```
<a href=<%= @first_link.url %>><%= @first_link.description %></a>
<span><%= @first_link_first_tag.url %></span>
```

Send that code to Heroku and reload the page:

- `$ git add .`
- `$ git commit -m "join table viewable data"`
- `$ git push -u origin main`
- `$ git push -u heroku main`

[Picture]

## 6. Seed a database with more links and tags.

Now, let's make our list of links and tags slightly more robust by adding 10 links and 4 more tags.

In `seeds.rb` add Links with (url, description and date to post):

```
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
```

Then add a handful of tags for each of the links:

```
# Tag.create([{tagName: "learn"}, {tagName: "video"}, {tagName: "text"}, {tagName: "audio"}, {tagName: "game"}])
```

And, finally, connect the two via join table. Each instance on the join table defines a Link's tag.

```

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
```

- `$ git add .`
- `$ git commit -m "seed"`
- `$ git push -u origin main`
- `$ git push -u heroku main`
- `$ heroku run rake db:seed`

// SMOKE TEST

- `$ heroku run rails console`
- `Link.all` & `Tag.all` & `LinkTag.all`

––––––––––––––––––––––––––––––––––––––––––––––––

# 6. Create unique routes with join table.

Goal is to display links by tag. One route per tag.

Rails routes guide: https://guides.rubyonrails.org/routing.html

Steps:
1. Create a route `/video` that shows all links tagged with "video"
2. Update the logic in the controller for that route. 
3. Create a view `video.html.erb` that displays the data.
4. Repeat for all of the other tag routes.

## 1. Create a route `/video` that shows all links tagged with "video".

- Head over to `routes.rb`
- Add a new route:
```
get "/video", to: "articles#video"
```

## 2. Update the logic in the controller for that route.

- Head over to `articles_controller.rb`
- Add a new method for the new view:
```
def video
    @video_objects = []

    LinkTag.where(tag_id: 2).each do |video_link|
      @video_objects.push(Link.find(video_link.link_id))
    end
  end
```

Logic: 
- Create an array of link objects that are tagged as "video" by searching the join table for instances where the tag id for video appears. 
- Move through each of those join table instances one by one, pulling the link_id. 
- When a link_id is found, add it to the original array.

## 3. Create a view `video.html.erb` that displays the data.

> Note, you can't evaluate anything in your .html.erb files, because those get packaged with data first, then sent to the browser. The browser has no access to the database, so ActiveRecord functions are irrelevant. 

Display the array we created in `articles_controller.rb`, one link at a time. 

The html with erb integrated:

```
<% @video_objects.reverse.each do |video_object| %>
    <a target="_blank" href=<%= video_object.url %>> <%= video_object.postDate %></a>&nbsp <span style="font-size:10px;"><%= video_object.description %></span><br>
<% end %>
```

## 4. Repeat for all of the other tag routes.

The logic and process is the same. So I'll just include pictures of the three finals and their methods...

`routes.rb`
[Picture]
`articles_controller.rb`
[Picture]
`views/articles`

And you're now basically done.

––––––––––––––––––––––––––––––––––––––––––––––––

# 7. Set up and seed local environment.

- `$ heroku local` should receive a `NoDatabaseError`
- Using this thread [https://stackoverflow.com/questions/34203765/activerecordnodatabaseerror-fatal-database-db-development-postgresql-does-n].

> Honestly, didn't think this would work and still haven't taken the time to understand if the postgres db I created is on my computer and in Heroku's world. If you know, do tell!

- `rake db:create && rake db:migrate` (create the database and migrate tables generated from way back when)
- `heroku local`
- Receive new error `NoMethodError in Articles#index` with the key message: `undefined method 'url' for nil:NilClass` This just means that the datbase is initialized and empty so the functions we created in controller can't perform properly. Time to seed some data.
- As a reminder of what `seeds.rb` looks like:

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

- `rake db:seed`
- The app should now be visible at `http://0.0.0.0:5000/`
- Test the logic by clicking on the categories and visiting all of the routes.

When I did this initially, I had some date errors and needed to change info. 
- `heroku local:run rails console` 
(https://devcenter.heroku.com/articles/heroku-local) And the order of operations from this https://stackoverflow.com/questions/12329687/how-to-update-value-of-a-models-attribute: 

```
collison = Link.find(2)
collison.postDate = Date.parse('2021-06-18')
collisonl.save
``` 

- Spin up `heroku local` and you'll see the order of the page is incorrect. The db isn't ordering on IDs, but, rather, updated_at.
- Adding `.order(:id)` to my definitions in the controller:

```
def all
    @all_links = Link.all.order(:id)
end 
```

–––––––––––––––––––––––––––––––––––––––––––

# 8.  Add minimal CSS
No use in belaboring this section. It's a simple site. Here's the CSS MVP, just wanted basic spacing. Feel free to get creative.

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

# 9. Connect a custom domain

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
- From: https://stackoverflow.com/questions/23233414/heroku-how-to-push-seeds-rb-to-existing-rails-app
- And: https://ninjadevel.com/seeding-database-ruby-on-rails/