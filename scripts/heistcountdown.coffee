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

  robot.hear /heist|fh2|fng|rac[e]+s/i, (res) ->

    room = res.message.room

    return if room != 'fng' && room != 'gaming' && room != 'infinity-testing'
    # body...


    tzOffset   = 1 # Timezone offset
    dateOffset = new Date();
    dateOffset = (dateOffset.getTime() + (tzOffset * 3600 * 1000))
    dateNow    = new Date(dateOffset);
    dateNext   = new Date(dateOffset);
    heistTime  = 21 #9pm
    heistDay   = 5 #friday

    # Fast forward to tomorrow if we're past heist time
    if dateNext.getHours() >= heistTime
    	dateNext.setDate(dateNext.getDate() + 1)

    # Step forward to next heist day
    while(dateNext.getDay() != heistDay)
    	dateNext.setDate(dateNext.getDate() + 1)

    # Set heist time against new date
    dateNext.setHours(heistTime)
    dateNext.setMinutes(0)
    dateNext.setSeconds(0)

    # Diff that shit
    dateNowM = dateNow.getTime();
    dateNextM = dateNext.getTime();

    # Could be useful
    day = (24*3600*1000);
    hour = (3600*1000);
    minute = (60*1000);
    second = 1000;

    # how many milliseconds until next heist day/hour
    timeToCalc = (dateNextM - dateNowM)

    # Calculate the floor leaving the remainder for the next time unit
    days = Math.floor(timeToCalc / day)
    timeToCalc = timeToCalc % day

    hours = Math.floor(timeToCalc / hour)
    timeToCalc = timeToCalc % hour

    minutes = Math.floor(timeToCalc / minute)
    timeToCalc = timeToCalc % minute

    seconds = Math.floor(timeToCalc / second)
    timeToCalc = timeToCalc % second

    replies = [
      "Gaming in #{days} days, #{hours} hours, #{minutes} minutes, and #{seconds} seconds!",
      "#{days} days, #{hours} hours, #{minutes} minutes, and #{seconds} seconds until we play... guess this MixUp!",
      "T minus #{days} days, #{hours} hours, #{minutes} minutes, #{seconds} Seconds",
    ]

    res.send res.random replies
