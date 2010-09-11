"
Icicle space filling visualization.
"
Class {
	#name : #InfoVisIcicle,
	#superclass : #InfoVisVisualization,
	#category : 'InfoVis-Core'
}

{ #category : #accessing }
InfoVisIcicle class >> infoVisName [

	^ 'Icicle'
]

{ #category : #options }
InfoVisIcicle >> animate: aBoolean [
	"Default: false.  Whether to animate transitions."

	self optionAt: 'animate' put: aBoolean
]

{ #category : #'options - convenience' }
InfoVisIcicle >> beHorizontal [

	self orientation: 'h'.
]

{ #category : #'options - convenience' }
InfoVisIcicle >> beVertical [

	self orientation: 'v'.
]

{ #category : #options }
InfoVisIcicle >> constrained: aBoolean [
	"Default: false.  Whether to show the entire tree when loaded or just the number of levels specified by levelsToShow."

	self optionAt: 'constrained' put: aBoolean
]

{ #category : #options }
InfoVisIcicle >> duration: anObject [
	"Described in Options.Fx.  Default: 700."

	self optionAt: 'duration' put: anObject
]

{ #category : #options }
InfoVisIcicle >> fps: anObject [
	"Described in Options.Fx.  Default: 45."

	self optionAt: 'fps' put: anObject
]

{ #category : #options }
InfoVisIcicle >> labelType: anObject [
	"Described in Options.Label.  Default: Native."

	self optionAt: 'Label.type' put: anObject
]

{ #category : #options }
InfoVisIcicle >> levelsToShow: aNumber [
	"Default: 3.  The number of levels to show for a subtree.  This number is relative to the selected node."

	self optionAt: 'levelsToShow' put: aNumber
]

{ #category : #options }
InfoVisIcicle >> nodeType: anObject [
	"Described in Options.Node.  Default: rectangle."

	self optionAt: 'Node.type' put: anObject
]

{ #category : #options }
InfoVisIcicle >> offset: aNumber [
	"Default: 2.  Boxes offset."

	self optionAt: 'offset' put: aNumber
]

{ #category : #options }
InfoVisIcicle >> orientation: aString [
	"Default: h.  Whether to set horizontal or vertical layouts.  Possible values are 'h' and 'v'."

	self optionAt: 'orientation' put: aString
]
