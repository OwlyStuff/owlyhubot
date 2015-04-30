# Description:
#   Returns a random broscience quote

module.exports = (robot) ->

  broQuotes = [
    "it's not a rest for me, it's a rest for the weights",
    "LEGacy",
    "You should never train your back, I don't train mine because I can't see it",
    "Reps for Jesus",
    "ARMageddon",
    "Bro Science: 50% fact, 50% magic, 100% results.",
    "It's the vernal equinox can't do legs today",
    "Flexibility? You mean the ability to FLEX!",
    "How can I do cardio with my biceps?",
    "Crossfit builds cardiovascular  endurance... or as I like to call it; The ability to lose gains!",
    "Ask not what your country can do for you, ask; does your country even lift!",
    "#Shredicated",
    "#Swelfie",
    "Gainsville",
    "http://i0.wp.com/crossfitfenrir.com/wp-content/uploads/2013/02/hFFC63D44.jpeg?resize=359%2C450",
    "Father forgive me for these gains i'm about to receive",
    "Taking gains from Jesus",
    "But do you even?",
    "You mirin?",
    "http://www.demgainz.com/pics/t/l-135.jpg"
  ]

  robot.hear /broscience|flex|even lift|do you lift|do you even/i, (res) ->
    res.send res.random broQuotes
