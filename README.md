# README

Welcome to the Everlywell Backend Coding Challenge.

## CHECKLIST

- [x] A member can be created using their name and a personal website address.

- [ ] When a member is created, all the heading (h1-h3) values are pulled in from the website to that members profile.

- [x] The website url is shortened (e.g. using <http://goo.gl).>

- [-] After the member has been added, I can define their friendships with other existing members. Friendships are bi-directional i.e. If David is a friend of Oliver, Oliver is always a friend of David as well.

- [x] Relationship schema for bi-directional friendships

- [x] The interface should list all members with their name, short url and the number of friends.

- [-] Viewing an actual member should display the name, website URL, shortening, website headings, and links to their friends' pages.

  - [x] Name
  - [x] Website URL
  - [x] Shortening
  - [ ] Website Headings
  - [ ] Links to Friend's pages

- [ ] Now, looking at Alan's profile, I want to find experts in the application who write about a certain topic and are not already friends of Alan.

- [ ] Results should show the path of introduction from Alan to the expert e.g. Alan wants to get introduced to someone who writes about 'Dog breeding'. Claudia's website has a heading tag "Dog breeding in Ukraine". Bart knows Alan and Claudia. An example search result would be Alan -> Bart -> Claudia ("Dog breeding in Ukraine").

We encourage the use of any libraries for everything except the search functionality, in which we want to see your simple algorithm approach.

# Instructions

To run this project, clone this repo, run `bundle install`, then `bin/rails db:migrate RAILS_ENV=development`, and then `rails s`.

It should be up and running on the localhost:3000 if you're in the terminal.

Currently using the gem ruby '2.7.0', ActiveRecord Migration is Version 5.2

# everlywell-proj
