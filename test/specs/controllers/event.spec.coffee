describe 'Event', ->
  Event = null
  
  beforeEach ->
    class Event extends Spine.Controller
  
  it 'can noop', ->
    