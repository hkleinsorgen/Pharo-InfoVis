"
A visualization that displays stacked area charts.
"
Class {
	#name : #InfoVisAreaChart,
	#superclass : #InfoVisChart,
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

{ #category : #functions }
InfoVisAreaChart >> filter: filterStrings [
	" Filter selected stacks, collapsing all other stacks.  You can filter multiple stacks at the same time."

	^ self variableAccess call: 'filter' withArguments: filterStrings
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

{ #category : #functions }
InfoVisAreaChart >> restore [
	" Sets all stacks that could have been filtered visible."

	^ self variableAccess call: 'restore'
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
InfoVisAreaChart >> showAggregates: aBooleanOrFunction [
	"Default: true. Display the values of the stacks.
	Can also be a function that returns true or false to display or filter some values.
	That same function can also return a string with the formatted value"

	self optionAt: 'showAggregates' put: aBooleanOrFunction
]

{ #category : #options }
InfoVisAreaChart >> showLabels: aBooleanOrFunction [
	"Default: true. Display the name of the slots.
	Can also be a function that returns true or false to display or not each label."

	self optionAt: 'showLabels' put: aBooleanOrFunction
]

{ #category : #options }
InfoVisAreaChart >> type: aString [
	"Default: *'stacked'*.  Stack style.  Posible values are 'stacked', 'stacked:gradient' to add gradients."

	self optionAt: 'type' put: aString
]
