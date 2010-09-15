Class {
	#name : #InfoVisUtilsTest,
	#superclass : #InfoVisTest,
	#category : 'InfoVis-Tests'
}

{ #category : #tests }
InfoVisUtilsTest >> testEvent [

	self 
		assert: (self infoVis id: '42' on: 'onclick' do: ('event' asFunction: #(event)))
		equals: '$jit.util.addEvent($jit.id("42"),"onclick",function(event){event})'
]

{ #category : #tests }
InfoVisUtilsTest >> testId [

	self 
		assert: (self infoVis id: '42')
		equals: '$jit.id("42")'
]
