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
  
  @fromJSON: ->
    super
    @users[i] = new User(user) for user, i in @users
    @locations[i] = new Locatino(location) for location, i in @locations
    @ratings[i] = new Rating(rating) for rating, i in @ratings
  
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