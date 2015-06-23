# Description:
#   Example scripts for you to examine and try out.
#
# Notes:
#   They are commented out by default, because most of them are pretty silly and
#   wouldn't be useful and amusing enough for day to day huboting.
#   Uncomment the ones you want to try and experiment with.
#
#   These are from the scripting documentation: https://github.com/github/hubot/blob/master/docs/scripting.md

module.exports = (robot) ->

  robot.respond /heist me/i, (res) ->

    now       = new Date()
    day       = now.getDay()
    hour      = now.getUTCHours()
    outputStr = ''

    if day < 5 # days left to heist
        outputStr += 5 - day + ' days '

    if day == 6
        outputStr += 6 + ' days '

    if day == 7
        outputStr += 5 + ' days '

    if day == 5 # it's heists day
      if hour < 21
        outputStr += 21-hour-2 + ' hours '

    outputStr += 'to go until Heist Time'

    res.send outputStr
