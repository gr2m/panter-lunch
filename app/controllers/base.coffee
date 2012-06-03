Spine = require('spine')

class BaseController extends Spine.Controller
  
  constructor: ->
    @_debounce_methods()
    super
    
  debounce: []
  
  _debounce_methods: ->
    for method in @debounce
      console.log 'debouncing', method
      @["#{method}_debounce"] = $.debounce @[method], 1000
    
module.exports = BaseController