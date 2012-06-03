Base = require('models/base')

class User extends Base
  @configure 'User', 
    'name'
    'email'
    'is_active'
  
  @belongsTo 'event',   'models/event'
  @hasMany   'ratings', 'models/rating'
  
  # default values
  is_active: true
  
module.exports = User