Class {
	#name : #InfoVisEdgeOptions,
	#superclass : #InfoVisOptions,
	#category : 'InfoVis-Core'
}

{ #category : '*InfoVis-Core' }
InfoVisEdgeOptions class >> infoVisName [

	^ 'Edge'
]

{ #category : #options }
InfoVisEdgeOptions >> alpha: aNumber [
	"Default: 1.  The Edge's alpha value.  1 is for full opacity."

	self optionAt: #alpha put: aNumber
]

{ #category : #options }
InfoVisEdgeOptions >> canvasStyles: aObject [
	"Default: an empty object (i.e.  {}).  Attach any other canvas specific property that you'd set to the canvas context before plotting an Edge."

	self optionAt: #CanvasStyles put: aObject
]

{ #category : #options }
InfoVisEdgeOptions >> color: aString [
	"Default: '#ccb'.  Edge color."

	self optionAt: #color put: aString
]

{ #category : #options }
InfoVisEdgeOptions >> dim: aNumber [
	"Default: 15.  An extra parameter used by other complex shapes such as quadratic, bezier or arrow, to determine the shape's diameter."

	self optionAt: #dim put: aNumber
]

{ #category : #convenience }
InfoVisEdgeOptions >> displayAsArrows [

	self type: 'arrow'
]

{ #category : #convenience }
InfoVisEdgeOptions >> displayAsHyperlines [

	self type: 'hyperline'
]

{ #category : #convenience }
InfoVisEdgeOptions >> displayAsLines [

	self type: 'line'
]

{ #category : #options }
InfoVisEdgeOptions >> epsilon: aNumber [
	"Default: 7.  Only used when using enableForEdges in Options.Events.  This dimension is used to create an area for the line where the contains method for the edge returns true."

	self optionAt: #epsilon put: aNumber
]

{ #category : #options }
InfoVisEdgeOptions >> lineWidth: aNumber [
	"Default: 1.  Line/Edge width."

	self optionAt: #lineWidth put: aNumber
]

{ #category : #options }
InfoVisEdgeOptions >> overridable: aBoolean [
	"Default: false.  Determine whether or not general edges properties can be overridden by a particular Graph.Adjacence."

	self optionAt: #overridable put: aBoolean
]

{ #category : #options }
InfoVisEdgeOptions >> type: aString [
	"Default: 'line'.  Edge styles include 'line', 'hyperline', 'arrow'.  The default Edge type might vary in each visualization.  You can also implement custom Edge types."

	self optionAt: #type put: aString
]
