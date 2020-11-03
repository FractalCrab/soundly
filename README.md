# Soundly
## Team Information
- Joseph Antony - E19CSE357 (EB05) 
- Devansh Sharma- E19CSE385 (EB01)
- Abhinandan Sharma-E19CSE247   (EB01)
- Dhruv Devasthale- E19CSE167 (EB01)
 
## Introduction 
Introducing Soundly,  a social media platform where users, song artists, podcasters, or anyone who wishes to share their voice or song can upload their original work (songs, podcasts, etc) which will be displayed randomly in our feed so as to avoid bias and make their work reachable and easily accessible to a wider and diverse audience. You can log in to our web application, upload audio files, share music, or just scroll and explore through a customized feed of audio content. Ours is a simple music recommendation platform based on the songs most played by listeners all over the world. You will have a list of curated songs by people who are as passionate about music as them. The app will have multiple tabs that consist of a feed, search bar for searching specific artists, user profile page. The app will help the growth of indie music projects and art. As the feed will help to see other artists' work, there will be a plus button for a specific user to contribute/upload their own projects, which will then be displayed to multiple other users across the platform. 
The feed will be simple, random, and void of all biases. Each and every audio-art uploaded by a user will have an equal chance of being on the main feed, which removes any skill disparity amongst users. 
The app will also have an in-built music player that will play any audio content on the feed and will have features like lyrics, gapless payback, and low audio latencies.
We aim to make the application minimalistic and the ultimate goal is a simplistic user experience.
All favourite genres of an enthusiast under one roof. Deleting the need for multiple app circulation to find that one song which one wants to listen to.
Soundly is the one-stop solution to all song/podcasts streaming services.


## Problem Statement
Modern Social Media platforms are biased, influenced and have flaws in their business logic. The platforms specifically are volatile and vague in terms of media sharing. There are very few social media sites which are primarily focussed on musicians, podcasters and anyone who wishes to share their voice These days people struggle to share songs/podcasts without being judged on unrelated meta-factors, not pertaining to the quality of their song/podcast. Youtube is a good example of letting privileged artists progress and excel, the cause being the quality of their music video and thus particularly do not really give a chance to indie-artists who are not backed by professional record-holders and music companies. Mainstream music is eventually filtered and biased by objective factors really such as video views, likes, dislikes and comments.

## Objective
Our main objective is to set up an audio-based social platform which provides a clean and simple way of sharing songs and podcasts. This platform will provide a feed which will display audio files uploaded to our database. The feed will be simple, random and void of all biases. Each and every audio-art uploaded by a user will have an equal chance of being on the main feed, which removes any skill disparity amongst users. The song/podcast will be playable through our custom music player and can be shared with other users using our app.

## Software Requirements 
- Web browser (preferably Chrome)
- Working Audio drivers for web browser
- Stable internet connection

## Proposed System 
Soundly is a social media web app with its UI created with the help of flutter, with the app handling its backend through flask API written in python managing the project updates through git version control. Flutter helps us to build an interactive and user-friendly UI. User's functionalities & requests will be handled through Python with the help of Flask API. The project's database which will contain all login authentication, user's profile data will be managed via MySQL database. To maintain the project's progress we are using Git Version control. Users will be greeted with a login authentication page through which they will log into their profile, landing towards their profile feed, which will be randomized to make artists(users) work available to a wider range of audiences. The app will have multiple tabs that consist of a feed, search bar for searching specific artists, user profile page. The app will help the growth of indie music projects and art. The SQL database will consist of user id,  user password, audio data, and other metadata. As the feed will help to see other artists' work, there will be a plus button for a specific user to contribute/upload their own projects, which will then be displayed to multiple other users across the platform. The flak API will make the app efficient for handling user functionalities and providing fast UX making the app better. We are using Version control to help us track the progress of the project throughout the course until the deadline.
The profile page will be tailored according to the user and will display the specific genre of songs preferred by the user.
Multiple tabs will each have a different feature and the search bar will be optimised as per the end-user.
We aim to make the application minimalistic and the ultimate goal is a simplistic user experience.
All favourite genres of an enthusiast under one roof. Deleting the need for multiple app circulation to find that one song which one wants to listen to.
Soundly is the one-stop solution to all song/podcasts streaming services.

## Entity-Relationship diagram 




## Relational Model

- Create table Song
(
	Song_ID INT(15) NOT NULL,
	Title VARCHAR(64) NOT NULL,
	Genre VARCHAR(14) NOT NULL,
	Duration INT(10) NOT NULL,
	PRIMARY KEY (Song_ID)
);

- Create table User_info
(
	User_ID INT(15) NOT NULL,
	Password VARCHAR(64) NOT NULL,
	Name VARCHAR(64) NOT NULL,
	Song_ID INT(15) NOT NULL,
	PRIMARY KEY (User_ID),
	Foreign Key (Song_ID) references Song (Song_ID)
);	



