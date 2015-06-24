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

    day = 5 # friday
    d   = new Date
    (day = (Math.abs(+day || 0) % 7) - d.getDay()) < 0 && (day += 7)

    day && d.setDate(d.getDate() + day)

    nextFriday = d
    # 9pm
    nextFriday.setUTCHours(21, "00", "00", "00")

    # get total seconds between the times
    delta = Math.abs(nextFriday - now) / 1000;

    days = Math.floor(delta / 86400);
    delta -= days * 86400;

    hours = Math.floor(delta / 3600) % 24;
    delta -= hours * 3600;

    minutes = Math.floor(delta / 60) % 60;
    delta -= minutes * 60;

    seconds = Math.floor(delta % 60);

    res.send "Heisting in #{days} days, #{hours} hours, #{minutes} minutes, and #{seconds} seconds!"
