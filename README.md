# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
#Requests:
##  get 'higri_dates/loadData'
this will load data from csv file located in public folder in the class path
##get 'higri_dates/getLocationDates'
Query parameters example:
Put ?latitude=42.546245&longitude=1.601554
as a query parameter and this will return a json contains all the higri dates and times of the specified location

##sidekiq
There is a job runs every day at midnight which updates the higri dates and times of all locations
to run the job just run
 sidekiq 
command
