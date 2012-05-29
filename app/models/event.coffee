Spine = require('spine')

class Event extends Spine.Model
  @configure 'Event',
    'name'
    'description'
    'uuid'
    'users'
    'locations'
    'ratings'
  
module.exports = Event