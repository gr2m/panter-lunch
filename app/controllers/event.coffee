Spine = require('spine')

class Event extends Spine.Controller

  active: (params) ->
    if params.id is 'new'
      @log 'create new event'
    else
      @log 'load existing event'
      
    @html require("views/event")(@)
    super
    
module.exports = Event