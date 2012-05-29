describe 'Dicision', ->
  Dicision = null
  
  beforeEach ->
    class Dicision extends Spine.Model
      @configure 'Dicision'
  
  it 'can noop', ->
    