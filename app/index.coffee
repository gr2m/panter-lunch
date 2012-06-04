require('lib/setup')

Spine = require('spine')
HomeController  = require 'controllers/home'
EventController = require 'controllers/event'

class App extends Spine.Stack
  
  events: 
    'click a': '_navigate'
  
  controllers:
    home  : HomeController
    event : EventController
    
  routes:
    '/events/:uuid' : 'event'
    '/'             : 'home'
    ''              : 'home'
    
  constructor: ->
    
    super
    Spine.Route.setup()
    
  
  # PRIVATE
  
  _navigate: (event) ->
    $a = $ event.currentTarget

    href = $a.attr('href')
    
    # fixing IE7 bug
    href = href.replace("http://#{document.location.host}", "").replace("https://#{document.location.host}", "") if href
    
    if /^\//.test href
      
      # if href.indexOf('?') is -1
      #   @navigate href
      # else
      #   [path, query] = href.split('?')
      #   
      #   @navigate path, $.deparam(query)
      
      event.preventDefault()
      @navigate href
      return
      
      
    if href is '#'
      event.preventDefault()


#
window.onbeforeunload = ->
  if Spine.Ajax.pending
    '''Data is still being sent to the server; 
       you may lose unsaved changes if you close the page.'''
       
module.exports = App
    