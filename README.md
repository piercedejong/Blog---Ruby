# Forum

Ruby on Rails app that allows users to create posts for other people to view and post comments to

### Project Goals

This was my first ruby on rails project. I wanted to understand the basic concept of a rails app and using an API to sign-in and out with the Google+ API using OAuth.

### How the app works

You sign-in via the button at the top right the app. It redirects you to the Google sign-in page. Once signed-in, you have the ability to create a new Post for other users to view. Signed-in users will then be able to comment on the post.

The original creator of the Post has the ability to edit/delete his/her post and any comments posted on it.


## Installation

* First, go to https://console.developers.google.com/ and create a new project, go to the credentials tab and create a new one with http://localhost:3000/auth/google/callback as the redirect URL.

* Second, go to the Library tab and enable both the Google+ and Contacts API, and copy the Client ID and Client Secret

* Third, clone the app onto your local machine, open it up and create a .env file. Enter your Client ID and Secret into this .env file as shown below:

````
CLIENT_ID=XXXXXXXXXXXXXXXXXX
CLIENT_SECRET=XXXXXXXXXXXXXXXXXX
````

* Fourth, on your terminal navigate to the folder containing the app and run these commands, ```` bundle install ````. Then, ```` rails s````, to launch the app. In your browser, go to ```` localhost:3000````.

### Remaining Backlog Items

* Deploy the app to Heroku
* Add ability to add pictures to new posts
* Clean up the HTML
