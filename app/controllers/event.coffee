BaseController = require('controllers/base')
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
        @$ratings.html require("views/event/table")(@)
        
    else
      @model = new Event id: params.id
      @model.ajax().reload()
      @model.one 'ajaxSuccess', =>
        @$ratings.html require("views/event/table")(@)
      
    @html require("views/event")(@)
    super
    
  add_new_user: ->
    user = new User
    @model.users.push user
    @$('tbody tr:last-child').after require("views/event/new_user")(@)
    
  add_new_location: ->
    location = new Location
    @model.locations.push location
    @$('thead th:last-child').after require("views/event/new_location")(@)
    @$('tbody td:last-child').after require("views/event/new_rating")(@)
    
  save: ->
    console.log 'save'
    console.log @model.toJSON()
    
    
    # @model.save_debounced()
    
module.exports = EventController