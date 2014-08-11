# Description
#   A Hubot script that notify doorkeeper events
#
# Dependencies:
#   "cron": "^1.0.4",
#   "moment": "^2.8.1",
#   "time": "^0.11.0"
#
# Configuration:
#   HUBOT_DOORKEEPER_NOTIFIER_ROOM
#   HUBOT_DOORKEEPER_NOTIFIER_GROUP
#
# Commands:
#   None
#
# Author:
#   bouzuya <m@bouzuya.net>
#
module.exports = (robot) ->
  moment = require 'moment'
  {CronJob} = require 'cron'

  ROOM = process.env.HUBOT_DOORKEEPER_NOTIFIER_ROOM
  GROUP = process.env.HUBOT_DOORKEEPER_NOTIFIER_GROUP
  new CronJob '32 1 0 * * *', ->
    tomorrow = moment().add 0, 'days'
    robot
      .http 'http://api.doorkeeper.jp/groups/' + GROUP + '/events'
      .get() (err, _, body) ->
        if err?
          robot.logger.error err
          res.send 'hubot-doorkeeper-notifier: error'
          return
        events = JSON.parse body
        message = events.map (data) -> data.event
          .filter (event) -> tomorrow.isSame moment(event.starts_at), 'day'
          .map (event) -> """
            #{event.public_url}
            #{event.title}
            #{event.starts_at}/#{event.ends_at}
            #{event.venue_name}

            """
          .join '\n'
        robot.messageRoom(ROOM, message) if message?.length > 0
  , null, true, 'Asia/Tokyo'
