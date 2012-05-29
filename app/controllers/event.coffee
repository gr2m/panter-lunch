BaseController = require('controllers/base')
Event = require 'models/event'

class EventController extends BaseController

  elements: 
    '.ratings': '$ratings'
  
  events:
    'keyup .new input': 'new_shid'
  
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
    
  new_shid: ->
    console.log 'new_shid'
    
module.exports = EventController