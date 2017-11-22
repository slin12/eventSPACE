# README

Live Demo: https://event-space.herokuapp.com/ 

Demo credentials -- 

email: s.lin12@gmail.com

password: password

EventSPACE is a social media platform for planning and organizing events. Features include the ability to add friends, create events and invite friends, and RSVP to events.

## User Signup
The sign up process involves the user entering some basic information to create a user profile including their email, name, birthday, and a short bio. The user also has the option to add a profile photo, an embedded SoundCloud player.

## User Sign In
Users sign in by entering their email and password.

## User Dashboard
The User Dashboard is the signed in user’s hub for navigating the site. The Dashboard shows all current notifications and information for the signed in user. All pending friend requests and event invites are displayed.

The User Dashboard also has a search bar to find friends.

## User Profile
Every user has a public profile that can be viewed by other members of the site. The profile shows the user’s  photo, info, friend status, and SoundCloud player. Also displayed are the user’s friends list and their upcoming events.

## Friends
People can be added as friends. Users can add friends through their user profile. A friend request must be accepted to be added as a friend.

## Event Creation
Users can create events. To create an event, the user must search for the venue (found through the Yelp API) and location. After selecting the location, the user must enter the name of the event and specify the date, time, and whether the event is public or private.

The host can select who to invite from their friends list.

## Event Page
The Event Page displays all info related to the event including the venue, date, and time. Invited friends are displayed along with their RSVP status. Invited friends can update their RSVP status and post messages on the event page.

## Event Search
Public events can be searched by any user through the Event Search. Users can view all events and also search for events by zip code.
