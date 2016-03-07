# Description:
#   Returns a signature image for the provided username
#
# Dependencies:
#   None
#
# Commands:
#   hubot rl {username} - Reply back with the signature image for {username}
#
# Author:
#   catchamonkey

module.exports = (robot) ->

  robot.respond /rl (.*)/i, (msg) ->
    user = res.match[1]
    if user not ""
      msg.send "http://signature.rocketleaguestats.com/normal/xboxone/#{user}.png"
