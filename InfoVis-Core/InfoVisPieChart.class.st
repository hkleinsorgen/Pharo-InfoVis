"
A visualization that displays stacked bar charts.
"
Class {
	#name : #InfoVisPieChart,
	#superclass : #InfoVisChart,
	#category : 'InfoVis-Core'
}

{ #category : #accessing }
InfoVisPieChart class >> infoVisName [

	^ 'PieChart'
]

{ #category : #options }
InfoVisPieChart >> animate: aBoolean [
	"Default: true.  Whether to add animated transitions when plotting/updating the visualization."

	self optionAt: 'animate' put: aBoolean
]

{ #category : #options }
InfoVisPieChart >> hoveredColor: aBooleanOrString [
	"Default: '#9fd4ff'.  Sets the selected color for a hovered pie stack."

	self optionAt: 'hoveredColor' put: aBooleanOrString
]

{ #category : #options }
InfoVisPieChart >> labelOffset: aNumber [
	"Default: 3.  Adds margin between the label and the default place where it should be drawn."

	self optionAt: 'labelOffset' put: aNumber
]

{ #category : #options }
InfoVisPieChart >> offset: aNumber [
	"Default: 25.  Adds margin between the visualization and the canvas."

	self optionAt: 'offset' put: aNumber
]

{ #category : #options }
InfoVisPieChart >> resizeLabels: aBooleanOrNumber [
	"Default: false.  Resize the pie labels according to their stacked values.
	Set a number for resizeLabels to set a font size minimum."

	self optionAt: 'resizeLabels' put: aBooleanOrNumber
]

{ #category : #options }
InfoVisPieChart >> showLabels: aBoolean [
	"Default: true.  Display the name of the slots."

	self optionAt: 'showLabels' put: aBoolean
]

{ #category : #options }
InfoVisPieChart >> sliceOffset: aNumber [
	"Default: 0.  Separation between the center of the canvas and each pie slice."

	self optionAt: 'sliceOffset' put: aNumber
]

{ #category : #options }
InfoVisPieChart >> type: aString [
	"Default: *'stacked'*.  Stack style.  Posible values are 'stacked', 'stacked:gradient' to add gradients."

	self optionAt: 'type' put: aString
]

{ #category : #options }
InfoVisPieChart >> updateHeights: aBoolean [
	"Default: false.  Only for mono-valued (most common) pie charts.
	Resize the height of the pie slices according to their current values."

	self optionAt: 'updateHeights' put: aBoolean
]
