# hubot-doorkeeper-notifier

A Hubot script that notify doorkeeper events

## Installation

    $ npm install git://github.com/bouzuya/hubot-doorkeeper-notifier.git

or

    $ # TAG is the package version you need.
    $ npm install 'git://github.com/bouzuya/hubot-doorkeeper-notifier.git#TAG'

## Sample Interaction

    bouzuya> hubot help doorkeeper-notifier
    hubot> hubot doorkeeper-notifier - doorkeeper-notifier

    bouzuya> hubot doorkeeper-notifier
    hubot> doorkeeper-notifier!

See [`src/scripts/doorkeeper-notifier.coffee`](src/scripts/doorkeeper-notifier.coffee) for full documentation.

## License

MIT

## Development

### Run test

    $ npm test

### Run robot

    $ npm run robot


## Badges

[![Build Status][travis-badge]][travis]
[![Dependencies status][david-dm-badge]][david-dm]

[travis]: https://travis-ci.org/bouzuya/hubot-doorkeeper-notifier
[travis-badge]: https://travis-ci.org/bouzuya/hubot-doorkeeper-notifier.svg?branch=master
[david-dm]: https://david-dm.org/bouzuya/hubot-doorkeeper-notifier
[david-dm-badge]: https://david-dm.org/bouzuya/hubot-doorkeeper-notifier.png
