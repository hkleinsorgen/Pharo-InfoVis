"
Canvas drawing margins
"
Class {
	#name : #InfoVisMarginOptions,
	#superclass : #InfoVisOptions,
	#category : 'InfoVis-Core'
}

{ #category : '*InfoVis-Core' }
InfoVisMarginOptions class >> infoVisName [

	^ 'Margin'
]

{ #category : #options }
InfoVisMarginOptions >> bottom: aNumber [
	"Default: 0.  Bottom margin."

	self optionAt: 'bottom' put: aNumber
]

{ #category : #options }
InfoVisMarginOptions >> left: aNumber [
	"Default: 0.  Left margin."

	self optionAt: 'left' put: aNumber
]

{ #category : #options }
InfoVisMarginOptions >> right: aNumber [
	"Default: 0.  Right margin."

	self optionAt: 'right' put: aNumber
]

{ #category : #options }
InfoVisMarginOptions >> top: aNumber [
	"Default: 0.  Top margin."

	self optionAt: 'top' put: aNumber
]
