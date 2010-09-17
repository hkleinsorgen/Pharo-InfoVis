Class {
	#name : #InfoVisUtilsTest,
	#superclass : #InfoVisTest,
	#category : 'InfoVis-Tests'
}

{ #category : #tests }
InfoVisUtilsTest >> testCursor [

	self 
		assert: (self infoVis forceDirected cursor: 'foo')
		equals: 'infoVis1.canvas.getElement().style.cursor="foo"'
]

{ #category : #tests }
InfoVisUtilsTest >> testEvent [

	self 
		assert: (self infoVis id: '42' on: 'onclick' do: ('event' asFunction: #(event)))
		equals: '$jit.util.addEvent($jit.id("42"),"onclick",function(event){event})'
]

{ #category : #tests }
InfoVisUtilsTest >> testExtend [

	self 
		assert: (self infoVis sliceAndDice extendWithClass: InfoVisSliceAndDice)
		equals: '$jit.util.extend(infoVis1,new $jit.Layouts.TM.SliceAndDice)'
]

{ #category : #tests }
InfoVisUtilsTest >> testId [

	self 
		assert: (self infoVis id: '42')
		equals: '$jit.id("42")'
]
