BaseController = require('controllers/base')
Rating    = require 'models/rating'

class RatingController extends BaseController
  
  tag: 'td'
  
  events:
    'change select': 'save'
    
  constructor: ->
    super
    
  render: ->
    @html require("views/event/rating")(@)
    this
    
  save: ->
    console.log 'save'
    x = @model.fromForm( @$ 'form' ).save()
    console.log JSON.stringify x
    
module.exports = RatingController