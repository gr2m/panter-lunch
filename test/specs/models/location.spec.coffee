describe 'Location', ->
  Location = null
  
  beforeEach ->
    class Location extends Spine.Model
      @configure 'Location'
  
  it 'can noop', ->
    