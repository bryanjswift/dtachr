# dtachr

`dtachr` wraps the [dtach](http://dtach.sourceforge.net) command line utlity
to automate the creation of a socket file and send a notification to
[terminal-notifier](https://github.com/alloy/terminal-notifier). This utility
will only work with both `dtach` and `terminal-notifier` installed and in
PATH.

## Install Dependencies

The recommended method of installation is [Homebrew](http://brew.sh). With
Homebrew it is as simple as `brew install dtach terminal-notifier`. Both the
`dtach` and `terminal-notifier` commands must be available in the PATH for
dtachr to function.

In the future I'd like to add support for various notifiers so this can be used
somewhere besides OSX.

## Contributing to dtachr
 
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet.
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it.
* Fork the project.
* Start a feature/bugfix branch.
* Commit and push until you are happy with your contribution.
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

## Copyright

Copyright (c) 2013 Bryan Swift. See LICENSE.txt for further details.

