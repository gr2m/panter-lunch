BaseController = require('controllers/base')
Rating    = require 'models/rating'

class Rating extends BaseController
  
  tag: 'td'
  
  constructor: ->
    super
    
  render: ->
    @html require("views/event/rating")(@)
    this
    
module.exports = Rating