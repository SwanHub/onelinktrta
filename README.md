# README

This README would normally document whatever steps are necessary to get the
application up and running.

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