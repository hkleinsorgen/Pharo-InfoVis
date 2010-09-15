Class {
	#name : #InfoVisChart,
	#superclass : #InfoVisVisualization,
	#category : 'InfoVis-Core'
}

{ #category : #'options - convenience' }
InfoVisChart >> displayStacked [

	self type: 'stacked'
]

{ #category : #'options - convenience' }
InfoVisChart >> displayStackedWithGradients [

	self type: 'stacked:gradient'
]

{ #category : #functions }
InfoVisChart >> getLegend [
	" Returns an object containing as keys the legend names and as values hex strings with color values. "

	^ self variableAccess call: 'getLegend'
]

{ #category : #functions }
InfoVisChart >> getMaxValue [
	" Returns the maximum accumulated value for the stacks.  This method is used for normalizing the graph heights according to the canvas height. "

	^ self variableAccess call: 'getMaxValue'
]

{ #category : #options }
InfoVisChart >> type: aString [

	self subclassResponsibility
]
