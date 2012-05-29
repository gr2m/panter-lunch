BaseController = require('controllers/base')
Location  = require 'models/location'

class Location extends BaseController
  
  tag: 'th'
  
  events:
    'keyup input[type=text]': 'save'
  
  constructor: ->
    super
    
  render: ->
    @html require("views/event/location")(@)
    this
    
  save: ->
    @model.fromForm( @$ 'form' )
    
module.exports = Location