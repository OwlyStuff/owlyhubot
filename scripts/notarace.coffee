# Description:
#   FH2

module.exports = (robot) ->
  robot.hear /it(.*)s not a race/i, (res) ->
    setTimeout () ->
      res.send "But you wouldn't want to be last"
    , 5 * 1000
