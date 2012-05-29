Base      = require('models/base')
User      = require('models/user')
Location  = require('models/location')
Rating    = require('models/rating')

class Event extends Base
  
  @configure 'Event',
    'name'
    'description'
    'uuid'
    'users'
    'locations'
    'ratings'
    
  @extend Base.Ajax
  
  @fromJSON: (json)->
    obj = super
    obj.users[i] = new User(user) for user, i in json.users
    obj.locations[i] = new Locatino(location) for location, i in json.locations
    obj.ratings[i] = new Rating(rating) for rating, i in json.ratings
    obj
  
  # defaults
  users     : []
  locations : []
  ratings   : []
  
  constructor: ->
    @uuid or= @constructor.uuid()
    super
    
  _debounce_timeout: null
  save_debounced: ->
    window.clearTimeout @_debounce_timeout
    @_debounce_timeout = window.setTimeout (=> @save()), 3000
  
module.exports = Event