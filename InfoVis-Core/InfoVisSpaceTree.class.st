"
A Tree layout with advanced contraction and expansion animations.
"
Class {
	#name : #InfoVisSpaceTree,
	#superclass : #InfoVisVisualization,
	#category : 'InfoVis-Core'
}

{ #category : #accessing }
InfoVisSpaceTree class >> infoVisName [

	^ 'ST'
]

{ #category : #functions }
InfoVisSpaceTree >> addNodeInPath: id [
	" Adds a node to the current path as selected node.  The selected node will be visible (as in non-collapsed) at all times "

	^ self variableAccess call: 'addNodeInPath' with: id
]

{ #category : #functions }
InfoVisSpaceTree >> addSubtree: subtreeObject method: method onComplete: onComplete [ 
	" Adds a subtree."

	| arguments |
	arguments := onComplete notNil 
			ifTrue: [ Array with: subtreeObject with: method with: onComplete ]
			ifFalse: [ Array with: subtreeObject with: method ].
	^ self variableAccess call: 'addSubtree' withArguments: arguments
]

{ #category : #options }
InfoVisSpaceTree >> align: aString [
	"Defaults center.  Whether the tree alignment is left, center or right."

	self optionAt: 'align' put: aString
]

{ #category : #testing }
InfoVisSpaceTree >> canRefresh [

	^ true
]

{ #category : #functions }
InfoVisSpaceTree >> clearNodesInPath: id [
	" Removes all nodes tagged as selected by the addNodeInPath method. "

	^ self variableAccess call: 'clearNodesInPath' with: id
]

{ #category : #functions }
InfoVisSpaceTree >> compute [

	^ self variableAccess call: 'compute'
]

{ #category : #functions }
InfoVisSpaceTree >> compute: position [

	^ self variableAccess call: 'compute' with: position
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
InfoVisSpaceTree >> indent: aNumber [
	"Defaults 10.  Used when align is left or right and shows an indentation between parent and children."

	self optionAt: 'indent' put: aNumber
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
InfoVisSpaceTree >> multitree: aBoolean [
	"Defaults false.  Used with the node $orn data property for creating multitrees."

	self optionAt: 'multitree' put: aBoolean
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

{ #category : #functions }
InfoVisSpaceTree >> onClick: nodeId [

	^ self onClick: nodeId options: nil
]

{ #category : #functions }
InfoVisSpaceTree >> onClick: nodeId options: clickOptions [ 
	" Animates the ST to center the node specified by id "

	| arguments |
	arguments := clickOptions notNil 
			ifTrue: [ Array with: nodeId with: clickOptions ]
			ifFalse: [ Array with: nodeId ].
	^ self variableAccess call: 'onClick' withArguments: arguments
]

{ #category : #options }
InfoVisSpaceTree >> orientation: aString [
	"Defaults left.  Tree orientation layout.  Possible values are left, top, right, bottom."

	self optionAt: 'orientation' put: aString
]

{ #category : #'options - convenience' }
InfoVisSpaceTree >> orientationBottom [

	^ self orientation: 'bottom'
]

{ #category : #'options - convenience' }
InfoVisSpaceTree >> orientationLeft [

	^ self orientation: 'left'
]

{ #category : #'options - convenience' }
InfoVisSpaceTree >> orientationRight [

	^ self orientation: 'right'
]

{ #category : #'options - convenience' }
InfoVisSpaceTree >> orientationTop [

	^ self orientation: 'top'
]

{ #category : #functions }
InfoVisSpaceTree >> plot [
	" Plots the visualization.  This is a shortcut to fx.plot."

	^ self variableAccess call: 'plot'
]

{ #category : #functions }
InfoVisSpaceTree >> refresh [
	" Computes positions and plots the tree. "

	^ self variableAccess call: 'refresh'
]

{ #category : #functions }
InfoVisSpaceTree >> removeSubtree: subtreeId removeRoot: removeRoot method: method onComplete: onComplete [ 
	" Adds a subtree."

	| arguments |
	arguments := onComplete notNil 
			ifTrue: [ Array with: subtreeId with: removeRoot with: method with: onComplete ]
			ifFalse: [ Array with: subtreeId with: removeRoot with: method ].
	^ self variableAccess call: 'removeSubtree' withArguments: arguments
]

{ #category : #functions }
InfoVisSpaceTree >> root [
	
	^ self variableAccess access: 'root'
]

{ #category : #functions }
InfoVisSpaceTree >> select: nodeId onComplete: onComplete [ 
	" Selects a node in the ST without performing an animation.  Useful when selecting nodes which are currently hidden or deep inside the tree."

	| arguments |
	arguments := onComplete notNil 
			ifTrue: [ Array with: nodeId with: onComplete ]
			ifFalse: [ Array with: nodeId ].
	^ self variableAccess call: 'select' withArguments: arguments
]

{ #category : #functions }
InfoVisSpaceTree >> setRoot: rootId method: method onComplete: onComplete [ 
	" Switches the current root node.  Changes the topology of the Tree."

	| arguments |
	arguments := onComplete notNil 
			ifTrue: [ Array with: rootId with: method with: onComplete ]
			ifFalse: [ Array with: rootId with: method ].
	^ self variableAccess call: 'setRoot' withArguments: arguments
]

{ #category : #options }
InfoVisSpaceTree >> siblingOffset: aNumber [
	"Defaults 5.  Separation offset between siblings."

	self optionAt: 'siblingOffset' put: aNumber
]

{ #category : #options }
InfoVisSpaceTree >> subtreeOffset: aNumber [
	"Defaults 8.  Separation offset between subtrees."

	self optionAt: 'subtreeOffset' put: aNumber
]

{ #category : #functions }
InfoVisSpaceTree >> switchAlignment: align method: method onComplete: onComplete [
	" Switches the tree alignment."

	| arguments |
	arguments := onComplete notNil 
			ifTrue: [ Array with: align with: method with: onComplete ]
			ifFalse: [ Array with: align with: method ].
	^ self variableAccess call: 'switchAlignment' withArguments: arguments
]

{ #category : #functions }
InfoVisSpaceTree >> switchPosition: position method: method onComplete: onComplete [ 
	" Switches the tree orientation."

	| arguments |
	arguments := onComplete notNil 
			ifTrue: [ Array with: position with: method with: onComplete ]
			ifFalse: [ Array with: position with: method ].
	^ self variableAccess call: 'switchPosition' withArguments: arguments
]
