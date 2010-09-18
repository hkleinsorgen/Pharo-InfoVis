"
A visualization that lays graphs using a Force-Directed layout algorithm.
"
Class {
	#name : #InfoVisForceDirected,
	#superclass : #InfoVisLayoutedGraph,
	#category : 'InfoVis-Core'
}

{ #category : #accessing }
InfoVisForceDirected class >> infoVisName [

	^ 'ForceDirected'
]

{ #category : #testing }
InfoVisForceDirected >> canRefresh [

	^ true
]

{ #category : #options }
InfoVisForceDirected >> iterations: aNumber [
	"Default: 50.  The number of iterations for the spring layout simulation.  Depending on the browser's speed you could set this to a more 'interesting' number, like 200."

	self optionAt: 'iterations' put: aNumber
]

{ #category : #options }
InfoVisForceDirected >> levelDistance: aNumber [
	"Default: 50.  The natural length desired for the edges."

	self optionAt: 'levelDistance' put: aNumber
]
