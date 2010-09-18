"
Facade for objects and utility functions provided by the InfoVis library
"
Class {
	#name : #InfoVis,
	#superclass : #JSObject,
	#category : 'InfoVis-Core'
}

{ #category : #creation }
InfoVis >> areaChart [
	" A visualization that displays stacked area charts. "

	^ self create: InfoVisAreaChart
]

{ #category : #creation }
InfoVis >> barChart [
	" A visualization that displays stacked bar charts "

	^ self create: InfoVisBarChart
]

{ #category : #private }
InfoVis >> create: anInfoVisClass [

	^ (anInfoVisClass context: self renderContext)
		rendererClass: self species;
		yourself
]

{ #category : #convenience }
InfoVis >> extend: aVisualization with: anotherObject [
	"Augment an object by appending another object's properties. "

	^ (self access: 'util') call: 'extend' with: aVisualization variableAccess with: anotherObject
]

{ #category : #creation }
InfoVis >> forceDirected [
	" A visualization that lays graphs using a Force-Directed layout algorithm. "

	^ self create: InfoVisForceDirected
]

{ #category : #creation }
InfoVis >> hyperTree [
	" A Hyperbolic Tree/Graph visualization "

	^ self create: InfoVisHyperTree
]

{ #category : #creation }
InfoVis >> icicle [
	" Icicle space filling visualization. "

	^ self create: InfoVisIcicle
]

{ #category : #convenience }
InfoVis >> id: aString [
	" Works just like document.getElementById.
	It's not necessary to use this function, it's just for convenience "

	^ self call: 'id' with: aString
]

{ #category : #convenience }
InfoVis >> id: id on: anEventName do: anOject [ 
	" Cross-browser add event listener.
	It's not necessary to use this function, it's just for convenience "

	| node |
	node := self copy id: id.
	^ ( self access: 'util' ) call: 'addEvent' with: node with: anEventName with: anOject asFunction
]

{ #category : #printing }
InfoVis >> javascriptContentOn: aStream [ 

	aStream nextPutAll: '$jit'.
]

{ #category : #creation }
InfoVis >> pieChart [
	" A visualization that displays stacked bar charts. "

	^ self create: InfoVisPieChart
]

{ #category : #creation }
InfoVis >> radialGraph [
	" A radial graph visualization with advanced animations. "

	^ self create: InfoVisRadialGraph
]

{ #category : #creation }
InfoVis >> sliceAndDice [
	" A slice and dice TreeMap visualization. "

	^ self create: InfoVisSliceAndDice
]

{ #category : #creation }
InfoVis >> spaceTree [
	" A Tree layout with advanced contraction and expansion animations. "

	^ self create: InfoVisSpaceTree
]

{ #category : #creation }
InfoVis >> squarified [
	" A squarified TreeMap visualization. "

	^ self create: InfoVisSquarified
]

{ #category : #creation }
InfoVis >> strip [
	" A strip TreeMap visualization. "

	^ self create: InfoVisStrip
]

{ #category : #creation }
InfoVis >> sunBurst [
	" A radial space filling tree visualization. "

	^ self create: InfoVisSunBurst
]
