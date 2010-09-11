"
A radial graph visualization with advanced animations.
"
Class {
	#name : #InfoVisRadialGraph,
	#superclass : #InfoVisVisualization,
	#category : 'InfoVis-Core'
}

{ #category : '*InfoVis-Core' }
InfoVisRadialGraph class >> infoVisName [

	^ 'RGraph'
]

{ #category : #options }
InfoVisRadialGraph >> interpolation: aString [
	"Default: linear.  Describes the way nodes are interpolated.  Possible values are 'linear' and 'polar'."

	self optionAt: 'interpolation' put: aString
]

{ #category : #options }
InfoVisRadialGraph >> levelDistance: aNumber [
	"Default: 100.  The distance between levels of the tree."

	self optionAt: 'levelDistance' put: aNumber
]
