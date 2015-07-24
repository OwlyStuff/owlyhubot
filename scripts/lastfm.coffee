# Description:
#   Returns the last played song from lastfm

module.exports = (robot) ->

  robot.respond /song me/i, (msg) ->
      msg.http('http://ws.audioscrobbler.com/2.0/?method=user.getrecenttracks&user=infinitycloud&api_key=c615dc032e5e2762397b37d88498a366&format=json&limit=1&extended=1')
          .get() (error, response, body) ->
              # passes back the complete reponse
              response = JSON.parse(body)
              if error == null
                  track  = response.recenttracks.track
                  images = track.artist.image
                  [first, med, lastImage] = images
                  msg.send "Just played #{track.name} by #{track.artist.name} - #{track.url}"
                  msg.send "#{lastImage['#text']}"
              else
                  msg.send "Unable to get song right now."
