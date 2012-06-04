BaseController = require('controllers/base')

Location  = require 'models/location'

class LocationController extends BaseController
  
  tag: 'th'
  
  events:
    'keyup  input': 'save'
    'change input': 'save'
  
  constructor: ->
    super
    
  render: ->
    @html require("views/event/location")(@)
    this
    
  save: ->
    @model.fromForm( @$ 'form' ).save()
    
module.exports = LocationController