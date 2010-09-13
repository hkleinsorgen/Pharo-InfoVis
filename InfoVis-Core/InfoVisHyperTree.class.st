"
A Hyperbolic Tree/Graph visualization
"
Class {
	#name : #InfoVisHyperTree,
	#superclass : #InfoVisVisualization,
	#category : 'InfoVis-Core'
}

{ #category : #accessing }
InfoVisHyperTree class >> infoVisName [

	^ 'Hypertree'
]

{ #category : #testing }
InfoVisHyperTree >> canRefresh [

	^ true
]

{ #category : #options }
InfoVisHyperTree >> duration: anObject [
	"Described in Options.Fx.  It's default value has been changed to 1500."

	self optionAt: 'duration' put: anObject
]

{ #category : #options }
InfoVisHyperTree >> edgeType: anObject [
	"Described in Options.Edge.  It's default value has been changed to hyperline."

	self optionAt: 'Edge.type' put: anObject
]

{ #category : #options }
InfoVisHyperTree >> fps: anObject [
	"Described in Options.Fx.  It's default value has been changed to 35."

	self optionAt: 'fps' put: anObject
]

{ #category : #options }
InfoVisHyperTree >> offset: aNumber [
	"Default: 0.  A number in the range [0, 1) that will be substracted to each node position to make a more compact Hypertree.  This will avoid placing nodes too far from each other when a there's a selected node."

	self optionAt: 'offset' put: aNumber
]

{ #category : #options }
InfoVisHyperTree >> radius: aStringOrNumber [
	"Default: auto.  The radius of the disc to plot the Hypertree in.  'auto' will take the smaller value from the width and height canvas dimensions.  You can also set this to a custom value, for example 250."

	self optionAt: 'radius' put: aStringOrNumber
]
