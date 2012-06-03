BaseController   = require('controllers/base')
RatingController = require('controllers/rating')
User      = require 'models/user'
Location  = require 'models/location'
Rating    = require 'models/rating'

class UserController extends BaseController
  
  tag: 'tr'
  
  events:
    'keyup  th input[type=text]':     'save'
    'change th input[type=checkbox]': 'save'
  
  constructor: ->
    super
    
  render: ->
    @html require("views/event/user")(@)
    
    for location in @event.locations().all()
      rating = @model.ratings().findByAttribute 'location_id', location.id      
      
      unless rating
        rating = @event.ratings().create
          location_id: location.id
          user_id: @model.id
        
      c = new RatingController event: @event, user: @model, model: rating
      @append c.render().el
      
    this
    
  save: ->
    @model.fromForm( @$ 'th form' ).save()
    
module.exports = UserController