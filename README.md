# Flight Booker

Flight Booker is a mock airline-booking website. It is meant to showcase the use of Rails associations and how they interact with nested forms to build a flight booking application.

## Getting started

To get started with the app, clone the repo and then install the needed gems:

```
$ bundle install --without production
```

Next, migrate the database:

```
$ rails db:migrate
```

Finally, run the test suite to verify that everything is working correctly:

```
$ rails test
```

If the test suite passes, you'll be ready to run the app in a local server:

```
$ rails server
```

## N+1 Problem and Fix

Original average load time for this application's main page was 2574ms. After fixing the N+1 query for the main form, I reduced the load time to 602ms on average.

Original average load time for search results was 1845ms. I reduced it to an average of 221ms. 

The numbers don't tell the whole story. The page no longer lags for several seconds but loads the data almost instantly.

## Acknowledgments

Instructions for this project can be found at https://www.theodinproject.com/courses/ruby-on-rails/lessons/building-advanced-forms?ref=lc-pb
