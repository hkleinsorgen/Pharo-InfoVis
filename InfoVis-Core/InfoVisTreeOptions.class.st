"
Options related to (strict) Tree layout algorithms.  These options are used by the ST visualization.
"
Class {
	#name : #InfoVisTreeOptions,
	#superclass : #InfoVisOptions,
	#category : 'InfoVis-Core'
}

{ #category : #accessing }
InfoVisTreeOptions class >> infoVisName [

	^ 'Tree'
]

{ #category : #options }
InfoVisTreeOptions >> align: aString [
	"Default: center.  Whether the tree alignment is 'left', 'center' or 'right'."

	self optionAt: 'align' put: aString
]

{ #category : #'options - convenience' }
InfoVisTreeOptions >> beHorizontal [

	self orientation: 'h'.
]

{ #category : #'options - convenience' }
InfoVisTreeOptions >> beVertical [

	self orientation: 'v'.
]

{ #category : #options }
InfoVisTreeOptions >> indent: aNumber [
	"Default: 10.  Used when align is left or right and shows an indentation between parent and children."

	self optionAt: 'indent' put: aNumber
]

{ #category : #options }
InfoVisTreeOptions >> multitree: aBoolean [
	"Default: false.  Used with the node $orn data property for creating multitrees."

	self optionAt: 'multitree' put: aBoolean
]

{ #category : #options }
InfoVisTreeOptions >> orientation: aString [
	"Default: 'left'.  Tree orientation layout.  Possible values are 'left', 'top', 'right', 'bottom'."

	self optionAt: 'orientation' put: aString
]

{ #category : #options }
InfoVisTreeOptions >> siblingOffset: aNumber [
	"Default: 5.  Separation offset between siblings."

	self optionAt: 'siblingOffset' put: aNumber
]

{ #category : #options }
InfoVisTreeOptions >> subtreeOffset: aNumber [
	"Default: 8.  Separation offset between subtrees."

	self optionAt: 'subtreeOffset' put: aNumber
]
