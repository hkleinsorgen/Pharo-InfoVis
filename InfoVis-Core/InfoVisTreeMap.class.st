"
Abstract class providing base functionality for TM.Squarified, TM.Strip and TM.SliceAndDice visualizations.
"
Class {
	#name : #InfoVisTreeMap,
	#superclass : #InfoVisVisualization,
	#category : 'InfoVis-Core'
}

{ #category : #accessing }
InfoVisTreeMap class >> layoutName [

	^ '$jit.Layouts.', self infoVisName
]

{ #category : #options }
InfoVisTreeMap >> animate: aBoolean [
	"Default: false.  Whether to animate transitions."

	self optionAt: 'animate' put: aBoolean
]

{ #category : #'options - convenience' }
InfoVisTreeMap >> beHorizontal [

	self orientation: 'h'.
]

{ #category : #'options - convenience' }
InfoVisTreeMap >> beVertical [

	self orientation: 'v'.
]

{ #category : #testing }
InfoVisTreeMap >> canRefresh [

	^ true
]

{ #category : #options }
InfoVisTreeMap >> constrained: aBoolean [
	"Default: false.  Whether to show the entire tree when loaded or just the number of levels specified by levelsToShow."

	self optionAt: 'constrained' put: aBoolean
]

{ #category : #'options - convenience' }
InfoVisTreeMap >> displayCushions [
	" undocumented option "

	self optionAt: 'cushion' put: true
]

{ #category : #options }
InfoVisTreeMap >> duration: anObject [
	"Described in Options.Fx.  Default: 700."

	self optionAt: 'duration' put: anObject
]

{ #category : #'functions - convencience' }
InfoVisTreeMap >> enter [
	" assume that the first argument is passed somehow "

	^ self enter: self firstArgument
]

{ #category : #functions }
InfoVisTreeMap >> enter: aNode [
	" Sets the node as root."

	^ self variableAccess call: 'enter' with: aNode
]

{ #category : #'extend - convencience' }
InfoVisTreeMap >> extendWithClass: aTreeMapClass [
	
	^ self infoVis extend: self with: (JSStream on: aTreeMapClass layoutName) create
]

{ #category : #'extend - convencience' }
InfoVisTreeMap >> extendWithSliceAndDice [
	
	^ self extendWithClass: InfoVisSliceAndDice
]

{ #category : #'extend - convencience' }
InfoVisTreeMap >> extendWithSquarified [
	
	^ self extendWithClass: InfoVisSquarified
]

{ #category : #'extend - convencience' }
InfoVisTreeMap >> extendWithStrip [
	
	^ self extendWithClass: InfoVisStrip
]

{ #category : #options }
InfoVisTreeMap >> fps: anObject [
	"Described in Options.Fx.  Default: 45."

	self optionAt: 'fps' put: anObject
]

{ #category : #functions }
InfoVisTreeMap >> leaf: aNode [
	" Returns whether the node is a leaf."

	^ self variableAccess call: 'leaf' with: aNode
]

{ #category : #options }
InfoVisTreeMap >> levelsToShow: aNumber [
	"Default: 3.  The number of levels to show for a subtree.  This number is relative to the selected node."

	self optionAt: 'levelsToShow' put: aNumber
]

{ #category : #options }
InfoVisTreeMap >> nodeType: anObject [
	"Described in Options.Node.  Default: rectangle."

	self optionAt: 'Node.type' put: anObject
]

{ #category : #options }
InfoVisTreeMap >> offset: aNumber [
	"Default: 2.  Boxes offset."

	self optionAt: 'offset' put: aNumber
]

{ #category : #options }
InfoVisTreeMap >> orientation: aString [
	"Default: h.  Whether to set horizontal or vertical layouts.  Possible values are 'h' and 'v'."

	self optionAt: 'orientation' put: aString
]

{ #category : #functions }
InfoVisTreeMap >> out [
	" Sets the parent node of the current selected node as root.."

	^ self variableAccess call: 'out'
]

{ #category : #functions }
InfoVisTreeMap >> plot [
	" Plots the visualization.  This is a shortcut to fx.plot."

	^ self variableAccess call: 'plot'
]

{ #category : #options }
InfoVisTreeMap >> titleHeight: aNumber [
	"Default: 13.  The height of the title rectangle for inner (non-leaf) nodes."

	self optionAt: 'titleHeight' put: aNumber
]
