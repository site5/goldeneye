Goldeneye [![Goldeneye Build Status][Build Icon]][Build Status]
===========================================================

Goldeneye allows for easy interaction with the [R1Soft CDP API][].
This library was first created for internal use at [Site5 LLC][].

Goldeneye has been tested on MRI 1.8.7, MRI 1.9.2, MRI 1.9.3 Preview 1,
Rubinius 2.0, and JRuby 1.6.2.

[Site5 LLC]: http://www.site5.com
[R1Soft CDP API]: http://wiki.r1soft.com/display/R1D/Documentation
[Build Status]: http://travis-ci.org/site5/goldeneye
[Build Icon]: https://secure.travis-ci.org/site5/goldeneye.png?branch=master

Basic Examples
--------------

    Goldeneye.config(
      :url        => "http://my.cdp.server:7080",
      :user       => "theusername",
      :password   => "thepassword"
    )

    cdp = Goldeneye::CDP.new
    cdp.get_registered_cdps

Command Line Usage
------------------

    Tasks:
      goldeneye help [TASK]      # Describe available tasks or one specific task
      goldeneye utils <command>  # Utils commands
      goldeneye version          # Outputs the current program version

      goldeneye utils help [COMMAND]     # Describe subcommands or one specific subcommand
      goldeneye utils storage_disks      # Lists storage disks and its memory information

    Options:
      -U, --api-username, [--api-username=API_USERNAME]  # API USERNAME; Required.
      -P, --api-password, [--api-password=API_PASSWORD]  # API PASSWORD; Required.
      -H, --api-url, [--api-url=API_URL]                 # API URL; Required.
      -d, --debug, [--debug=DEBUG]                       # API DEBUG; False by default

    To check the available options for a given action, you can execute the following command:

        goldeneye utils help storage_disks

Default Config for Command Line
--------------------------------

The command line utility, goldeneye, will look for a .goldeneye.yml file in ~/. You can specify some defaults.

    ~/.goldeneye.yml
    username: theusername
    password: thepassword
    url: "http://my.cdp.server:7080" # URL to the API endpoint

Requirements
------------

* logging
* xml-simple
* savon

Documentation
-------------

* http://goldeneye.rubyforge.org/goldeneye/

Installation
------------

    gem install goldeneye

Contributors
------------

* [Fabio Kreusch](http://github.com/fabiokr)

Note on Patches/Pull Requests
-----------------------------

* Fork the project.
* Add yourself to the Contributors list
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a
  future version unintentionally.
* Commit, do not mess with rakefile, version, or history.
  (if you want to have your own version, that is fine but bump version in a commit by itself I can ignore when I pull)
* Send me a pull request. Bonus points for topic branches.

Copyright
---------

Copyright (c) 2010-2012 Site5. See LICENSE for details.
