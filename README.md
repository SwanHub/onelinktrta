# README

The purpose of this project is to relearn the basics of coding. For today's purposes that is 
1. Creating the correct dev environment. 
2. Properly using VSCode. 
3. Successfully create a rails app on local environment. Change things around and display my own custom info on PORT 3000. 
4. Send that app up to heroku. 
5. Create a database that links to the app. 
6. Display data from the database.

Thing I re-learned about coding while doing this:

* There is a gem called yarn (deprecated and irrelevant) and there is a node package called yarn (the one we want). Figuring out that I had the gem installed, needed to uninstall that and reinstall the node version took some time and energy. A familiar frustration, figuring out someone else's rules.

* Small things like the difference between '<% yield %>' and '<%= yield %>' are crucial to success as a developer. Attention to detail. In the above case, either everything appears or nothing appears. Quite a difference.

* 2FA introduces a new set of authentication issues that likewise took some time to figure out. Finally, though, we've hooked up our repo to github.


Possible current issues
- Not listening on the right $PORT (never set that up).
- Postgres not properly setup. Clearly not functioning properly on local.
- I think I'll need to create this rails app from new, connect it to GH, push some commits, etc. so I can START with it connected to postgres. Too much headache for me to work through at this hour. 

Order of operations to create + deploy a new app
- Make sure the computer itself is ready to be a dev environment (black box of error messages)
- `rails new app_name --database=postgresql` and don't forget that postgres action, otherwise you're fucked. 
- Give it version control with git ==> `git init` (maybe something more than that), then `stats` + `add` + `commit -m "first message`
    - You now have an app that exists in code on your computer and has version control. 
- To test that it's working cd in and use `rails s` to spin up a local server. If puma, yarn and everything else is installed correctly, then you should see the default Rails page. Nice. Now time to connect to Heroku.
- Heroku has 10 different things it wants you to do to setup existing applications. Follow their detailed instructions, which include creating a random instructional called a Procfile. 
- Things that aren't yet clear are the role of postgres on your local computer and what configuring I need to do with the env variable $PORT. I could start from scratch, or try and figure out what's wrong with the current app, which I think will be beneficial overall for my understanding of how things work.

Ok goodbye. It shouldn't take me 3 hours to deploy something from scratch. Especially using Rails.

Well, somehow it worked. I just sent the thing up into the heroku universe and... it built. So. That's good. 

We're back in it.... Next step is to link this baby to a database. Imagined steps: 
 
- Initialize a database (local) 
- Initiatize tables (local)
- Initialize & migrate tables in heroku production. 
- Access the console. 
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
    Example tags: 
        - Subject matter (horse, animal, education, niche)
        - Media type (video, article, interactive, twitter thread)
        - Website (YouTube, Reddit, independent, etc.)


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


Final step: connect a domain.
We'll do `swanl.industries/onelinktrta`

`www.swan.industries`

https://nikodunk.com/heroku-ssl-google-domains-2019/

https://devcenter.heroku.com/articles/custom-domains

Okay, so briefly I think it worked. But the article above hath led me astray. Heroku article assumes some knowledge of things, which I don't have. Tomorrow, need to do a review of DNS actions, what they mean, how they work, etc.

The next step here is to add a domain. 

Question: do I add an "admin" side after that which allows me to add more links without going to heroku console? Would be nice and relevant to re-explore POST requests. 

A reminder that is interesting: you don't need to pay to hook up a domain to your website. Not with Heroku at least. Not sure what Webflow's deal is -- I have a sense that they make you pay to hook up a custom domain and push code out to prod. But with Heroku (and Aspect for that matter, although the whole thing is unpaid), you hook up a custom domain for free.

What does it mean to "hook up a custom domain"? 
1. Buy a custom domain. I use Google Domains. GoDaddy and Google are probably the most common domain marketplaces.
2. Generate a pointer on Heroku. This is where the code is stored. Tell the custom domain (when someone tries to GET it) to go to the Heroku pointer location. This is all done in the "custom resources" section using CNAME, etc.


# Hooking up a custom domain

I followed Niko's steps (1) and (2). I'm left with a few promising clues. 
1. The error message on Google has changed when I try to access www.swan.industries: This site can’t provide a secure connection. www.swan.industries sent an invalid response.
2. And in "Websites" I see a preview of the actual site I'm supposed to see when I type in www.swan.industries.

I'll try to follow through with step 3, although last night it didn't work. I wonder if at this stage it's just a matter of time. The "It could take up to 48hrs for X to take effect" msg.

I feel like theoretically, you shouldn't need a domain forwarding system at this stage. If the CNAME for www goes to the `heroku` pointer I've created, then that'll all we really need... If these further steps in 3 don't work then I'll just wait a few hours and see what happens. Can do join table tags in the meantime.

Checking to see the status of things at: 
- `heroku domains`
- Domain Name         DNS Record Type DNS Target                                             SNI Endpoint 
www.swan.industries CNAME           [redacted].herokudns.com undefined

- What is SNI endpoint?

Alright, I followed the directions in the article.

I need Heroku free tier to do this step `heroku certs:auto:refresh` – BUT that shouldn't be an issue. Heroku allows custom domains on the free tier. (see pricing)

An issue is now there is now website preview visibly available in my Google Domains dashboard. Sad because this part is so easy with Aspect. Why Heroku causing issues? Probably Tshepo is running a much simpler operation. No need of complex DNS targeting. Just send it all to one spot 

Well, evidently that article does not help. I'll now try going through Heroku's guide.  https://devcenter.heroku.com/articles/custom-domains
1. Verified my account.
--
1. (DONE) Confirm that you own the custom domain name. You can buy a custom domain name with a domain registration service.
2. Add the custom domain to your app with the heroku domains:add command.
3. Look up the Heroku-supplied DNS target for the custom domain using the heroku domains command.
4. Configure your app’s DNS provider to point to the Heroku-supplied DNS target.
5. Confirm that your app is accessible via the custom domain. There might be a delay while DNS changes propagate.


Ah, interesting note about Heroku. It's not a static IP address like it is with Aspect. So you're pointing at a thing that is shifting on Heroku's side. Whereas with Aspect, we just all pointed at the single IP address of whatever Tshepo's got going on over there.

I removed email forwarding in accordance with Heroku neglecting to include that in their docs. I should just be able to point the subdomain to the moving Heroku DNS target.

I removed the trailing `.` - maybe that'll do it.

```The trailing . on the target domain may or may not be required, depending on your DNS provider.```

Checking to see if the "host as propogated" `host www.swan.industries`

Things seem to be correctly linked for the site `www.swan.industries` Reason beings:
- On "Website preview" in my Google domains manager, I see onelinktrta. 
- If I type in `heroku domains` I get a seemingly correct readout. 
- If I type `host www.swan.industries` I get the correct readout: 
```www.swan.industries is an alias for obscure-peafowl-f358aftlaf82dbw42zc6qx61.herokudns.com.```

Thoughts: 
- It might just take a day or two for this thing to work (though that would be odd given my past experiences with CNAMEs). Then I'll refresh everything 
- maybe I'm missing a `.` somewhere? Like is the trailing dot an issue on Google's end?

Ahhh I see what's going on. Scrolling through Heroku settings, the site is supposed to be visible at http://www.swan.industries. No SSL. 

I'm going to enter the paid tier of Heroku $7/mo so I can get automatic SSL?

This guy's got it going on: https://stackoverflow.com/questions/67243264/heroku-with-lets-encrypt-couldnt-find-that-sni-endpoint.

To make some room in my budget, I just got rid of domain `datatrust.wiki` for $28/yr. 

So I have 2 options: 
- I can upgrade to paid tier for $7/mo.
- Or I can go through Let's Encrypt myself. And maybe even answer this guys question above if I make it out the other side. Let's do Let's Encrypt.
PS. It is definitely the "SNI Endpoint" undefined that is tripping things up.

# Let's Encrypt

- Great. Heroku is partial. https://certbot.eff.org/hosting_providers. 

OKAY. I just looked up the site on my phone and it is INDEED accessible on the internet. But SSL is NOT setup yet. Neither is the correct forwarding. We're moving forward.

So now it's confirmed that I can either a) setup Heroku or b) go through things manually with certbot. Let's do certbot.

Reading this https://medium.com/@bantic/free-tls-with-letsencrypt-and-heroku-in-5-minutes-807361cca5d3

And not immediately able to grok the documentation, I'm inclined to just pay.

Super interesting / conflicting / annoying that I can use a custom domain but in order for that domain to have SSL certification

Still curious about the SSL. Is it necessarily a paid thing? This article suggests not: https://sslrenewals.com/blog/difference-between-free-ssl-certificate-and-paid-ssl-certificate and there is a "manual configuration" process on Heroku I can go through.

https://devcenter.heroku.com/articles/ssl

Alright, I'm going to just pay. You win, Salesforce. BUT I'm going to do that at the end. Let's move on to other things.

Will need this at that point: https://devcenter.heroku.com/articles/automated-certificate-management

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

