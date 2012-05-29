BaseController     = require('controllers/base')
LocationController = require('controllers/location')
UserController     = require('controllers/user')


Event     = require 'models/event'
User      = require 'models/user'
Rating    = require 'models/rating'
Location  = require 'models/location'

class EventController extends BaseController

  elements: 
    '.ratings': '$ratings'
  
  events:
    'keyup tbody tr:last-child input' : 'add_new_user'
    'keyup thead th:last-child input' : 'add_new_location'
    'keyup input[type=text]': 'save'
    'change select, input[type=checkbox]': 'save'
  
  active: (params) ->
    if params.id is 'new'
      @model = Event.create()
      @$ratings.html require("views/event/table")(@)
      @model.one 'ajaxSuccess', =>
        @navigate "/events/#{@model.id}", false
        
        @model.locations.push new Location
        @model.users.push new User
        @render()
        
    else
      @model = new Event id: params.id
      @model.ajax().reload()
      @model.one 'ajaxSuccess', =>
        
        @model.locations.push new Location
        @model.users.push new User
        @render()
      
    @html require("views/event")(@)
    super
  
  render: ->
    @$ratings.html require("views/event/table")(@)
    
    for location in @model.locations
      c = new LocationController event: @model, model: location
      @$('thead tr').append c.render().el
      
    for user in @model.users
      c = new UserController event: @model, model: user
      @$('tbody').append c.render().el
  
  add_new_user: ->
    user = new User
    @model.users.push user
    c = new UserController event: @model, model: user
    @$('tbody').append c.render().el
    
  add_new_location: ->
    location = new Location
    @model.locations.push location
    # c = new LocationController event: @model, model: location
    # @$('thead tr').append c.render().el
    @render()
    
  save: ->
    console.log 'save'
    console.log @model.toJSON()
    @model.save_debounced()
    
module.exports = EventController