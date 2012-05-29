BaseController = require('controllers/base')

class Home extends BaseController
  
  active: =>
    @html require("views/home")(@)
    super
    
module.exports = Home