Base = require('models/base')

class Event extends Base
  
  @configure 'Event',
    'name'
    'description'
    'uuid'
    'users'
    'locations'
    'ratings'
    
  @extend Base.Ajax
  
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