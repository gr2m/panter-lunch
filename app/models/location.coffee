Base = require('models/base')

class Location extends Base
  @configure 'Location',
    'name'
    'description'
  
  
  @belongsTo 'event',   'models/event'
  @hasMany   'ratings', 'models/rating'
  
module.exports = Location