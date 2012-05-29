Spine = require('spine')

class Home extends Spine.Controller
  
  active: =>
    @html require("views/home")(@)
    super
    
module.exports = Home