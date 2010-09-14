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

{ #category : #testing }
InfoVisIcicle >> canRefresh [

	^ true
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

{ #category : #'functions - convencience' }
InfoVisIcicle >> enter [
	" assume that the first argument is passed somehow "

	^ self enter: self firstArgument
]

{ #category : #functions }
InfoVisIcicle >> enter: aNode [
	" Sets the node as root."

	^ self variableAccess call: 'enter' with: aNode
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

{ #category : #functions }
InfoVisIcicle >> out [
	" Sets the parent node of the current selected node as root.."

	^ self variableAccess call: 'out'
]

{ #category : #functions }
InfoVisIcicle >> plot [
	" Plots the Icicle visualization.  This is a shortcut to fx.plot."

	^ self variableAccess call: 'plot'
]
