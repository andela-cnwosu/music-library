# Music Library

<a href="https://codeclimate.com/github/andela-cnwosu/music-library"><img src="https://codeclimate.com/github/andela-cnwosu/music-library/badges/gpa.svg" /></a>
<a href="https://codeclimate.com/github/andela-cnwosu/music-library"><img src="https://codeclimate.com/github/andela-cnwosu/music-library/badges/issue_count.svg" /></a>
[![Build Status](https://travis-ci.org/andela-cnwosu/music-library.svg?branch=master)](https://travis-ci.org/andela-cnwosu/music-library)
[![Test Coverage](https://codeclimate.com/github/andela-cnwosu/music-library/badges/coverage.svg)](https://codeclimate.com/github/andela-cnwosu/music-library/coverage)

This is a console application that is used to access music files stored in a user’s PC. It gives users the ability to import song names into a playlist, view existing songs and search for songs using keywords. Note that this application does not play actual songs but can be modified to do so.

## Features

The music library can perform various functions by using simple commands. The user can type ‘help’ on the Terminal or Command Prompt to show other commands as shown below.

```ruby
$ help`
```

| Command | Description |
| --- | --- |
| list songs | List all songs in your music library |
| list artists | List all artist names in your music library |
| list genres | List all song genres in your music library |
| play song | Play a song in your music library |
| list artist | List all songs by an artist in your music library |
| list genre | List all songs in a genre in your music library |
| exit | Say GoodBye |

## Installation
### Dependencies

You need to have ruby installed in your system for this application to work. You can check if it is installed by viewing the version on your Command Prompt or Terminal with the following command.

```ruby
$ ruby -v`
```

You also need to install all ruby gems that accompany the project. A bundler can help you do this. See how this is done in ###Getting Started below.

### Getting Started

Clone or download the project as zip on GitHub and unzip to any directory of your choice.

```ruby
$ git clone git@github.com:andela-cnwosu/music-library.git
```

Navigate to the music library folder on your command line interface. 

```ruby
$ cd music-library
```

This is where you need to use the bundler. Type in the following command to install bundler.

```ruby
$ gem install bundler
```

Then install all gems in the project GemFile with the command:

```ruby
$ bundle install
```

Your music library is now up and running. To use the application, type the following on the command line:

```ruby
$ bin/musiclibrary
```

And that’s it! You can run any of the commands above.

##Developer Notes

###Testing

This application can be tested using the following command on your Terminal or Command Prompt:

```ruby
$ bundle exec rspec spec
```

You could run the tests using $ rspec spec but this might cause problems generated from having versions of installed gems.
You could also run individual tests by specifying the paths to the test file. An example is:

```ruby
$ bundle exec rspec spec/001_song_basics_spec.rb
```

###Further Development

This project can be modified to include other functionalities like playing actual songs and importing mp3 files to the playlist.