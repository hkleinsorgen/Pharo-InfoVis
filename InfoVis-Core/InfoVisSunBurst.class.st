"
A radial space filling tree visualization.
"
Class {
	#name : #InfoVisSunBurst,
	#superclass : #InfoVisVisualization,
	#category : 'InfoVis-Core'
}

{ #category : '*InfoVis-Core' }
InfoVisSunBurst class >> infoVisName [

	^ 'Sunburst'
]

{ #category : #options }
InfoVisSunBurst >> edgeType: anObject [
	"Described in Options.Edge.  Default: none."

	self optionAt: 'Edge.type' put: anObject
]

{ #category : #options }
InfoVisSunBurst >> interpolation: aString [
	"Default: linear.  Describes the way nodes are interpolated.  Possible values are 'linear' and 'polar'."

	self optionAt: 'interpolation' put: aString
]

{ #category : #options }
InfoVisSunBurst >> labelTextAlign: anObject [
	"Described in Options.Label.  Default: start."

	self optionAt: 'Label.textAlign' put: anObject
]

{ #category : #options }
InfoVisSunBurst >> labelTextBaseline: anObject [
	"Described in Options.Label.  Default: middle."

	self optionAt: 'Label.textBaseline' put: anObject
]

{ #category : #options }
InfoVisSunBurst >> levelDistance: aNumber [
	"Default: 100.  The distance between levels of the tree."

	self optionAt: 'levelDistance' put: aNumber
]

{ #category : #options }
InfoVisSunBurst >> nodeHeight: anObject [
	"Described in Options.Node.  Default: 0."

	self optionAt: 'Node.height' put: anObject
]

{ #category : #options }
InfoVisSunBurst >> nodeType: anObject [
	"Described in Options.Node.  Default: to multipie."

	self optionAt: 'Node.type' put: anObject
]
