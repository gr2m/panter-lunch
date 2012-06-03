Base      = require('models/base')
User      = require('models/user')
Location  = require('models/location')
Rating    = require('models/rating')

class Event extends Base
  
  @configure 'Event',
    'name'
    'description'
    'uuid'
    
  @extend Base.Ajax
  
  @hasMany    'users',     'models/user'
  @hasMany    'locations', 'models/location'
  @hasMany    'ratings',   'models/rating'
  
  toJSON: ->
    json = super
    json.users_attributes     = @users().all()
    json.locations_attributes = @locations().all()
    json.ratings_attributes   = @ratings().all()
    json
  
module.exports = Event