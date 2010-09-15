"
A visualization that displays stacked bar charts
"
Class {
	#name : #InfoVisBarChart,
	#superclass : #InfoVisChart,
	#category : 'InfoVis-Core'
}

{ #category : #accessing }
InfoVisBarChart class >> infoVisName [

	^ 'BarChart'
]

{ #category : #options }
InfoVisBarChart >> animate: aBoolean [
	"Default: true.  Whether to add animated transitions when filtering/restoring stacks."

	self optionAt: 'animate' put: aBoolean
]

{ #category : #options }
InfoVisBarChart >> barsOffset: aNumber [
	"Default: 0.  Separation between bars."

	self optionAt: 'barsOffset' put: aNumber
]

{ #category : #'options - convenience' }
InfoVisBarChart >> beHorizontal [

	self orientation: 'horizontal'.
]

{ #category : #'options - convenience' }
InfoVisBarChart >> beVertical [

	self orientation: 'vertical'.
]

{ #category : #'options - convenience' }
InfoVisBarChart >> displayGrouped [

	self type: 'grouped'
]

{ #category : #'options - convenience' }
InfoVisBarChart >> displayGroupedWithGradients [

	self type: 'grouped:gradient'
]

{ #category : #options }
InfoVisBarChart >> hoveredColor: aBooleanOrString [
	"Default: *'#9fd4ff'*.  Sets the selected color for a hovered bar stack."

	self optionAt: 'hoveredColor' put: aBooleanOrString
]

{ #category : #options }
InfoVisBarChart >> labelOffset: aNumber [
	"Default: 3.  Adds margin between the label and the default place where it should be drawn."

	self optionAt: 'labelOffset' put: aNumber
]

{ #category : #options }
InfoVisBarChart >> offset: aNumber [
	"Default: 25.  Adds margin between the visualization and the canvas."

	self optionAt: 'offset' put: aNumber
]

{ #category : #options }
InfoVisBarChart >> orientation: aString [
	"Default: 'horizontal'.  Sets the direction of the bars.  Possible options are 'vertical' or 'horizontal'."

	self optionAt: 'orientation' put: aString
]

{ #category : #options }
InfoVisBarChart >> showAggregates: aBoolean [
	"Default: true.  Display the sum of the values of the different stacks."

	self optionAt: 'showAggregates' put: aBoolean
]

{ #category : #options }
InfoVisBarChart >> showLabels: aBoolean [
	"Default: true.  Display the name of the slots."

	self optionAt: 'showLabels' put: aBoolean
]

{ #category : #options }
InfoVisBarChart >> type: aString [
	"Default: *'stacked'*.  Stack or grouped styles.  Posible values are 'stacked', 'grouped', 'stacked:gradient', 'grouped:gradient' to add gradients."

	self optionAt: 'type' put: aString
]
