"
These are Canvas general options, like where to append it in the DOM, its dimensions, background, and other more advanced option
"
Class {
	#name : #InfoVisCanvasOptions,
	#superclass : #InfoVisOptions,
	#category : 'InfoVis-Core'
}

{ #category : '*InfoVis-Core' }
InfoVisCanvasOptions class >> infoVisName [

	^ 'Canvas'
]

{ #category : #options }
InfoVisCanvasOptions >> background: aBooleanOrObject [
	"Default: false.  An object containing information about the rendering of a background canvas."

	self optionAt: 'background' put: aBooleanOrObject
]

{ #category : #options }
InfoVisCanvasOptions >> height: aNumber [
	"Default: to the container's offsetHeight.  The height of the canvas."

	self optionAt: 'height' put: aNumber
]

{ #category : #options }
InfoVisCanvasOptions >> injectInto: aStringOrElement [
	"Required. The id of the DOM container for the visualization.  It can also be an Element provided that it has an id."

	self optionAt: 'njectInto' put: aStringOrElement
]

{ #category : #options }
InfoVisCanvasOptions >> useCanvas: aBooleanOrObject [
	"Default: false.  You can pass another Canvas instance to be used by the visualization."

	self optionAt: 'useCanvas' put: aBooleanOrObject
]

{ #category : #options }
InfoVisCanvasOptions >> width: aNumber [
	"Default: to the container's offsetWidth.  The width of the canvas."

	self optionAt: 'width' put: aNumber
]

{ #category : #options }
InfoVisCanvasOptions >> withLabels: aBoolean [
	"Default: true.  Whether to use a label container for the visualization."

	self optionAt: 'withLabels' put: aBoolean
]
