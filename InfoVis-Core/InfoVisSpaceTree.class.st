"
A Tree layout with advanced contraction and expansion animations.
"
Class {
	#name : #InfoVisSpaceTree,
	#superclass : #InfoVisVisualization,
	#category : 'InfoVis-Core'
}

{ #category : '*InfoVis-Core' }
InfoVisSpaceTree class >> infoVisName [

	^ 'Spacetree'
]

{ #category : #options }
InfoVisSpaceTree >> constrained: aBoolean [
	"Default: true.  Whether to show the entire tree when loaded or just the number of levels specified by levelsToShow."

	self optionAt: 'constrained' put: aBoolean
]

{ #category : #options }
InfoVisSpaceTree >> duration: anObject [
	"Described in Options.Fx.  It's default value has been changed to 700."

	self optionAt: 'duration' put: anObject
]

{ #category : #options }
InfoVisSpaceTree >> levelDistance: aNumber [
	"Default: 30.  The distance between two consecutive levels of the tree."

	self optionAt: 'levelDistance' put: aNumber
]

{ #category : #options }
InfoVisSpaceTree >> levelsToShow: aNumber [
	"Default: 2.  The number of levels to show for a subtree.  This number is relative to the selected node."

	self optionAt: 'levelsToShow' put: aNumber
]

{ #category : #options }
InfoVisSpaceTree >> nodeType: anObject [
	"Described in Options.Node.  Default: set to rectangle."

	self optionAt: 'Node.type' put: anObject
]

{ #category : #options }
InfoVisSpaceTree >> offsetX: aNumber [
	"Default: 0.  The x-offset distance from the selected node to the center of the canvas."

	self optionAt: 'offsetX' put: aNumber
]

{ #category : #options }
InfoVisSpaceTree >> offsetY: aNumber [
	"Default: 0.  The y-offset distance from the selected node to the center of the canvas."

	self optionAt: 'offsetY' put: aNumber
]
