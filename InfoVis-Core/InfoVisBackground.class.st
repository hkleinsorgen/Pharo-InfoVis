Class {
	#name : #InfoVisBackground,
	#superclass : #InfoVisOptions,
	#category : 'InfoVis-Core'
}

{ #category : #accessing }
InfoVisBackground class >> infoVisName [

	^ 'background'
]

{ #category : #'options - convenience' }
InfoVisBackground >> canvasStyles [

	^ self optionsObject: InfoVisCanvasStyles
]
