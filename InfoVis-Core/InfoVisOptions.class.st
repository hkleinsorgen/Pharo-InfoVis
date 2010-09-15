"
Abstract suberclass for option objects
"
Class {
	#name : #InfoVisOptions,
	#superclass : #InfoVisObject,
	#category : 'InfoVis-Core'
}

{ #category : #printing }
InfoVisOptions >> javascriptContentOn: aStream [ 

	self options javascriptOn: aStream
]
