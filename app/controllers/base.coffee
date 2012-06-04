Spine = require('spine')

class BaseController extends Spine.Controller
  
  constructor: ->
    @_debounce_methods()
    super
    
  debounce: []
  
  _debounce_methods: ->
    for method in @debounce
      @["#{method}_debounce"] = $.debounce @[method], 1000
    
module.exports = BaseController