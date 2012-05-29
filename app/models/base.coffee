Spine = require('spine')

Spine.Model.host = "http://cors.local:9292/choice.local:3000"
class Base extends Spine.Model
  
  @uuid: (len = 7) ->
    chars = '0123456789abcdefghijklmnopqrstuvwxyz'.split('')
    radix = chars.length
    (
      chars[ 0 | Math.random()*radix ] for i in [0...len]
    ).join('')
  
  @host: "http://cors.local:9292/choice.local:3000"
module.exports = Base