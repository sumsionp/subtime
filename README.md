# Use as a Command Line Utility

The main purpose of this gem is to provide a command line timer that can time small activities that make up a large activity.

For example, if you want to study for 3 hours, but you want to break that up into 1 hour blocks, this is the perfect tool. You could run the following:

`subtime -m 180 -s 120,”Switch to Biology”,60,”Switch to Chemistry”`

This would count down from 180 minutes giving you the Biology reminder after an hour and the Chemistry reminder after another hour.
