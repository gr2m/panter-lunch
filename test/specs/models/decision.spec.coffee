describe 'Decision', ->
  Decision = null
  
  beforeEach ->
    class Decision extends Spine.Model
      @configure 'Decision'
  
  it 'can noop', ->
    