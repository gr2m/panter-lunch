BaseController = require('controllers/base')
Event = require 'models/event'

class EventController extends BaseController

  elements: 
    '.ratings': '$ratings'
  
  events:
    'keyup tbody tr:last-child input' : 'new_user'
    'keyup thead th:last-child input' : 'new_location'
  
  active: (params) ->
    if params.id is 'new'
      @model = Event.create()
      @$ratings.html require("views/event/table")(@)
      @model.one 'ajaxSuccess', =>
        @navigate "/events/#{@model.id}", false
        
    else
      @model = new Event id: params.id
      @model.ajax().reload()
      @model.one 'ajaxSuccess', =>
        @$ratings.html require("views/event/table")(@)
      
    @html require("views/event")(@)
    super
    
  new_user: ->
    @$('tbody tr:last-child').after require("views/event/new_user")(@)
    
  new_location: ->
    @$('thead th:last-child').after require("views/event/new_location")(@)
    @$('tbody td:last-child').after require("views/event/new_rating")(@)
    
module.exports = EventController