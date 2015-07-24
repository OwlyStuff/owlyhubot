# Description:
#   Returns the last song played from the configured lastfm account
#
# Dependencies:
#   None
#
# Configuration:
#   HUBOT_LAST_FM_API_KEY
#   HUBOT_LAST_FM_ACCOUNT_NAME
#
# Commands:
#   hubot song me - Reply back with the last song played, link on lastfm, and an artist image.
#
# Author:
#   catchamonkey

module.exports = (robot) ->

  apiKey  = process.env.HUBOT_LAST_FM_API_KEY
  account = process.env.HUBOT_LAST_FM_ACCOUNT_NAME

  robot.respond /song me/i, (msg) ->

      if process.env.HUBOT_LAST_FM_API_KEY == undefined
          msg.send 'You need to configure your lastfm API Key as an environment variable';

      if process.env.HUBOT_LAST_FM_ACCOUNT_NAME == undefined
          msg.send 'You need to configure your lastfm Account Name as an environment variable';

      msg.http("http://ws.audioscrobbler.com/2.0/?method=user.getrecenttracks&user=#{account}&api_key=#{apiKey}&format=json&limit=1&extended=1")
          .get() (error, response, body) ->
              # passes back the complete reponse
              response = JSON.parse(body)
              if error == null
                  track  = response.recenttracks.track
                  images = track.artist.image
                  lastImage = images[images.length - 1]
                  msg.send "Just played #{track.name} by #{track.artist.name} - #{track.url}"
                  msg.send "#{lastImage['#text']}"
              else
                  msg.send "Unable to get song right now."
