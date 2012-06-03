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
    'keyup input[type=text]': 'save_debounce'
    'change select, input[type=checkbox]': 'save_debounce'
  
  debounce: ['save']
  
  active: (params) ->
    if params.uuid is 'new'
      @model = Event.create({uuid: Event.uuid()})
      @$ratings.html require("views/event/table")(@)
      
      @model.one 'ajaxSuccess', =>
        @navigate "/events/#{@model.uuid}", false
        
        @model.locations().create({})
        @model.users().create({})
        @render()
        
    else
      Spine.Ajax.disable =>
        @model = Event.create uuid: params.uuid
      @model.ajax().reload url: "#{Event.host}/events/#{@model.uuid}"
      @model.one 'ajaxSuccess', =>

        @model.locations().create {}
        @model.users().create {}
        @render()
      
    @html require("views/event")(@)
    super
  
  render: ->
    @$ratings.html require("views/event/table")(@)
    
    for location in @model.locations().all()
      c = new LocationController event: @model, model: location
      @$('thead tr').append c.render().el
      
    for user in @model.users().all()
      c = new UserController event: @model, model: user
      @$('tbody').append c.render().el
  
  add_new_user: ->
    user = @model.users().create({})
    c = new UserController event: @model, model: user
    @$('tbody').append c.render().el
    
  add_new_location: ->
    location = @model.locations().create {}
    # c = new LocationController event: @model, model: location
    # @$('thead tr').append c.render().el
    @render()
    
  save: ->
    @model = @model.save()
    
module.exports = EventController