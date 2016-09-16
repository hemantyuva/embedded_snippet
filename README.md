
# Embedded snippet html For URL(Youtube & Instagram) With active admin

##Setup of active admin  

gem 'activeadmin', '~> 1.0.0.pre4'


## For Bundle 

bundle 


## install active admin 

rails g active_admin:install

## We have used without authentication 

rails g active_admin:install --skip-users # skips Devise install


## Generate active admin
rails generate active_admin:resource Model
Here Model is model name use this for generate active admin for that model 
note: first need to be create a model  

## Now for convert url to html snippet 

gem ruby-oembed

require 'oembed'

## Method for parse url to embedded format

resource = OEmbed::Providers::Youtube.get("http://www.youtube.com/watch?v=2BYXBC8WQ5k")


## Use angular js with rails 

gem 'angularjs-rails'

## Root path 

http://localhost:3000/admin/articles

see there list of all articles 
