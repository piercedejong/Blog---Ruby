# Forum

Rails app that allows users to create posts for other people to view and post comments to

### Project Goals

This was my first ruby on rails project. I wanted to understand the basic concept of a rails app and using an API to sign-in and out with the Google+ API using OAuth.

### How the app works

You sign-in via the button at the top right the app. It redirects you to the Google sign-in page. Once signed-in, you have the ability to create a new Post for other users to view. Signed-in users will then be able to comment on the post.

The original creator of the Post has the ability to edit/delete his/her post and any comments posted on it.


## Installation

* First, go to https://console.developers.google.com/ and create your Twitter App account in order to retrieve your Consumer Token and Consumer Secret.

* Second, clone the app onto your local machine, open it up and create a .env file. Enter your Consumer key and secret into this .env file as shown below:

````
CONSUMER_KEY=XXXXXXXXXXXXXXXXXX
CONSUMER_SECRET=XXXXXXXXXXXXXXXXXX
````

* Third, ```` bundle install ````. Then, ```` rails s````, to launch the app. In your browser, go to ```` localhost:3000````.

### Remaining Backlog Items

* Figure out how to automate this process.
* Turn it into a browser extension.
* Turn it into a React Native app (just to learn React Native).
