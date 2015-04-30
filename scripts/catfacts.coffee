# Description:
#   Returns a random broscience quote

module.exports = (robot) ->

  catFacts = [
    'A female cat is also known to be called a "queen" or a "molly."',
    'Rather than nine months, cats\' pregnancies last about nine weeks.',
    'A healthy 10-pound cat only needs about 220-350 calories a day, while a human needs roughly 2,000.',
    'The color of York Chocolates becomes richer with age. Kittens are born with a lighter coat than the adults.',
    'Genetically, cats\' brains are more similar to that of a human than a dog\'s brain.',
    'Cats have a 5 toes on their front paws and 4 on each back paw.',
    'Cats actually have dreams, just like us. They start dreaming when they reach a week old.',
    'Around the world, cats take a break to nap —a catnap— 425 million times a day.',
    'Collectively, kittens yawn about 200 million time per hour.'
  ]

  robot.hear /bro|broscience|flex|even lift|do you lift|lift|do you even/i, (res) ->
    res.send res.random catFacts
