Spine = require('spine')

if location.port is '9294' # local
  Spine.Model.host = "http://cors.local:9292/choice.local:3000"
else
  Spine.Model.host = "http://cors.io/panter-lunch.herokuapp.com"

class Base extends Spine.Model
  
  @uuid: (len = 7) ->
    chars = '0123456789abcdefghijklmnopqrstuvwxyz'.split('')
    radix = chars.length
    (
      chars[ 0 | Math.random()*radix ] for i in [0...len]
    ).join('')
    
  toJSON: ->
    json = super
    delete json.id if @id is @cid
    json
    
module.exports = Base
