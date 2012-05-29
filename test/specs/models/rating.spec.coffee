describe 'Rating', ->
  Rating = null
  
  beforeEach ->
    class Rating extends Spine.Model
      @configure 'Rating'
  
  it 'can noop', ->
    