# Project 3 - *Twitter*

**Twitter** is a basic twitter app to read and compose tweets the [Twitter API](https://apps.twitter.com/).

Time spent: **10.5** hours spent in total

## User Stories

The following **required** functionality is completed:

- [X] User sees app icon in home screen and styled launch screen
- [X] User can sign in using OAuth login flow
- [X] User can Logout
- [X] User can view last 20 tweets from their home timeline
- [X] In the home timeline, user can view tweet with the user profile picture, username, tweet text, and timestamp.
- [X] User can pull to refresh.
- [X] User can tap the retweet and favorite buttons in a tweet cell to retweet and/or favorite a tweet.
- [X] User can compose a new tweet by tapping on a compose button.
- [X] Using AutoLayout, the Tweet cell should adjust its layout for iPhone 11, Pro and SE device sizes as well as accommodate device rotation.
- [X] User should display the relative timestamp for each tweet "8m", "7h"
- [X] Tweet Details Page: User can tap on a tweet to view it, with controls to retweet, favorite, and reply.

The following **stretch** features are implemented:

- [ ] User can view their profile in a *profile tab*
  - Contains the user header view: picture and tagline
  - Contains a section with the users basic stats: # tweets, # following, # followers
  - [ ] Profile view should include that user's timeline
- [ ] User should be able to unretweet and unfavorite and should decrement the retweet and favorite count. Refer to [[this guide|unretweeting]] for help on implementing unretweeting.
- [ ] Links in tweets are clickable.
- [ ] User can tap the profile image in any tweet to see another user's profile
  - Contains the user header view: picture and tagline
  - Contains a section with the users basic stats: # tweets, # following, # followers
- [ ] User can load more tweets once they reach the bottom of the feed using infinite loading similar to the actual Twitter client.
- [ ] When composing, you should have a countdown for the number of characters remaining for the tweet (out of 280) (**1 point**)
- [ ] After creating a new tweet, a user should be able to view it in the timeline immediately without refetching the timeline from the network.
- [ ] User can reply to any tweet, and replies should be prefixed with the username and the reply_id should be set when posting the tweet (**2 points**)
- [ ] User sees embedded images in tweet if available
- [ ] User can switch between timeline, mentions, or profile view through a tab bar (**3 points**)
- [ ] Profile Page: pulling down the profile page should blur and resize the header image. (**4 points**)


The following **additional** features are implemented:

- [ ] List anything else that you can get done to improve the app functionality!

Please list two areas of the assignment you'd like to **discuss further with your peers** during the next class (examples include better ways to implement something, how to extend your app in certain ways, etc):

1. Better ways to implement setting a property with models. In the Models lab, the movie property of the DetailsViewController is set by using setMovie, which is a default setter that is overrided. However, in the Twitter assignment, it is not used and instead tweet is assigned directly. On top of that, the presentation of models in one of the All Hands showed the movie cell being updated with a method called updateWithMovie that did essentially the same tasks as setMovie. Which of these options are preferred or is there an even better way to accomplish this?
2. How others are using Auto Layout to design the app! It'd be insightful seeing how everyone is making use of the tools and potentially discover new/simpler ways to achieve a more impressive UI.

## Video Walkthrough

Here's a walkthrough of implemented user stories:

1. App Icon and Launch Screen
<img src='https://i.imgur.com/XrS2zyp.gif' title='App Icon' width='' alt='App Icon' />

2. Login
<img src='https://i.imgur.com/RJ8BuqG.gif' title='Login' width='' alt='Login' />

3. Logout
<img src='https://i.imgur.com/Qdd1W0M.gif' title='Logout' width='' alt='Logout' />

4. Timeline
<img src='https://i.imgur.com/NzxhLHj.gif' title='Timeline' width='' alt='Timeline' />

5. Refresh
<img src='https://i.imgur.com/TF9lyPN.gif' title='Refresh' width='' alt='Refresh' />

6. Favoriting and Retweeting
<img src='https://i.imgur.com/zbUFmEC.gif' title='Tap' width='' alt='Tap' />

7. Compose a new tweet
<img src='https://i.imgur.com/ek6sSqG.gif' title='Compose' width='' alt='Compose' />

8. Auto Layout
- iPhone SE
<img src='https://i.imgur.com/aNhSYpc.gif' title='iPhone SE' width='' alt='SE' />

- Phone 8
<img src='https://i.imgur.com/elVTM8f.gif' title='iPhone 8' width='' alt='8' />

- iPhone 8 Plus
<img src='https://i.imgur.com/fwSZFdJ.gif' title='iPhone 8 Plus' width='' alt='8Plus' />

9. Tweet Details View
<img src='https://i.imgur.com/lDsmqxg.gif' title='Details' width='' alt='Details' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

1. An error was encountered during the declaration of the protocol ComposeViewControllerDelegate. Declaring the protocol after a property definition using the protocol resulted in an error as the protocol had not yet been defined. Simply moving the protocol above the interface allowed the property to be defined.
2. An error was encountered when trying to retweet. The endpoint for retweeting had different parameters than favoriting and a different url that required some formatting. After inspecting the Twitter API documentation, the issue was quickly resolved.

## Credits

List an 3rd party libraries, icons, graphics, or other assets you used in your app.

- [AFNetworking](https://github.com/AFNetworking/AFNetworking) - networking task library
- [DateTools](https://github.com/MatthewYork/DateTools) - dates and time library
- [Twitter](https://about.twitter.com/en_us/company/brand-resources.html) - Twitter brand assets

## License

    Copyright 2020 David Lara

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
