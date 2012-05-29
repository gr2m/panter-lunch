describe 'Event', ->
  Event = null
  
  beforeEach ->
    class Event extends Spine.Model
      @configure 'Event'
  
  it 'can noop', ->
    