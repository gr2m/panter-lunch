Base = require('models/base')

class Rating extends Base
  @configure 'Rating', 'score'
  
  @belongsTo 'event',    'models/event'
  @belongsTo 'user',     'models/user'
  @belongsTo 'location', 'models/location'
  
module.exports = Rating