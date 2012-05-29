BaseController   = require('controllers/base')
RatingController = require('controllers/rating')
User      = require 'models/user'
Location  = require 'models/location'
Rating    = require 'models/rating'

class User extends BaseController
  
  tag: 'tr'
  
  events:
    'keyup  th input[type=text]':     'save'
    'change th input[type=checkbox]': 'save'
  
  constructor: ->
    super
    
  render: ->
    @html require("views/event/user")(@)
    
    for location in @event.locations
      rating = new Rating 
        location_id: location.id
        user_id: @model.id
        
      c = new RatingController event: @model, model: rating
      console.log 'c.render().el', c.render().el
      @append c.render().el
      
    this
    
  save: ->
    @model.fromForm( @$ 'th form' )
    
module.exports = User