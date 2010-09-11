"
A visualization that displays stacked area charts.
"
Class {
	#name : #InfoVisAreaChart,
	#superclass : #InfoVisVisualization,
	#category : 'InfoVis-Core'
}

{ #category : #accessing }
InfoVisAreaChart class >> infoVisName [

	^ 'AreaChart'
]

{ #category : #options }
InfoVisAreaChart >> animate: aBoolean [
	"Default: true.  Whether to add animated transitions when filtering/restoring stacks."

	self optionAt: 'animate' put: aBoolean
]

{ #category : #'options - convenience' }
InfoVisAreaChart >> displayStacked [

	self type: 'stacked'
]

{ #category : #'options - convenience' }
InfoVisAreaChart >> displayStackedWithGradients [

	self type: 'stacked:gradient'
]

{ #category : #options }
InfoVisAreaChart >> filterOnClick: aBoolean [
	"Default: true.  Select the clicked stack by hiding all other stacks."

	self optionAt: 'filterOnClick' put: aBoolean
]

{ #category : #options }
InfoVisAreaChart >> labelOffset: aNumber [
	"Default: 3.  Adds margin between the label and the default place where it should be drawn."

	self optionAt: 'labelOffset' put: aNumber
]

{ #category : #options }
InfoVisAreaChart >> restoreOnRightClick: aBoolean [
	"Default: true.  Show all stacks by right clicking."

	self optionAt: 'restoreOnRightClick' put: aBoolean
]

{ #category : #options }
InfoVisAreaChart >> selectOnHover: aBoolean [
	"Default: true.  If true, it will add a mark to the hovered stack."

	self optionAt: 'selectOnHover' put: aBoolean
]

{ #category : #options }
InfoVisAreaChart >> showAggregates: aBoolean [
	"Default: true.  Display the sum of the values of the different stacks."

	self optionAt: 'showAggregates' put: aBoolean
]

{ #category : #options }
InfoVisAreaChart >> showLabels: aBoolean [
	"Default: true.  Display the name of the slots."

	self optionAt: 'showLabels' put: aBoolean
]

{ #category : #options }
InfoVisAreaChart >> type: aString [
	"Default: *'stacked'*.  Stack style.  Posible values are 'stacked', 'stacked:gradient' to add gradients."

	self optionAt: 'type' put: aString
]
