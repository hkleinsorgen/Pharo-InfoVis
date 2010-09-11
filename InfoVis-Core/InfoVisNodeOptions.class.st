"
Provides Node rendering options for Tree and Graph based visualizations.
"
Class {
	#name : #InfoVisNodeOptions,
	#superclass : #InfoVisOptions,
	#category : 'InfoVis-Core'
}

{ #category : #accessing }
InfoVisNodeOptions class >> infoVisName [

	^ 'Node'
]

{ #category : #options }
InfoVisNodeOptions >> align: aString [
	"Default: center.  Possible values are 'center', 'left' or 'right'.  Used only by the ST visualization, these parameters are used for aligning nodes when some of they dimensions vary."

	self optionAt: 'align' put: aString
]

{ #category : #options }
InfoVisNodeOptions >> alpha: aNumber [
	"Default: 1.  The Node's alpha value.  1 is for full opacity."

	self optionAt: 'alpha' put: aNumber
]

{ #category : #options }
InfoVisNodeOptions >> angularWidth: aNumber [
	"Default: 1.  Used in radial layouts (like RGraph or Sunburst visualizations).  The amount of relative 'space' set for a node."

	self optionAt: 'angularWidth' put: aNumber
]

{ #category : #options }
InfoVisNodeOptions >> autoHeight: aBoolean [
	"Default: false.  Whether to set an auto height for the node depending on the content of the Node's label."

	self optionAt: 'autoHeight' put: aBoolean
]

{ #category : #options }
InfoVisNodeOptions >> autoWidth: aBoolean [
	"Default: false.  Whether to set an auto width for the node depending on the content of the Node's label."

	self optionAt: 'autoWidth' put: aBoolean
]

{ #category : #options }
InfoVisNodeOptions >> canvasStyles: aObject [
	"Default: an empty object (i.e.  {}).  Attach any other canvas specific property that you'd set to the canvas context before plotting a Node."

	self optionAt: 'CanvasStyles' put: aObject
]

{ #category : #options }
InfoVisNodeOptions >> color: aString [
	"Default: #ccb.  Node color."

	self optionAt: 'color' put: aString
]

{ #category : #options }
InfoVisNodeOptions >> dim: aNumber [
	"Default: 3.  An extra parameter used by other node shapes such as circle or square, to determine the shape's diameter."

	self optionAt: 'dim' put: aNumber
]

{ #category : #options }
InfoVisNodeOptions >> height: aNumber [
	"Default: 20.  Used by 'rectangle' and 'ellipse' node types.  The height of the node shape."

	self optionAt: 'height' put: aNumber
]

{ #category : #options }
InfoVisNodeOptions >> lineWidth: aNumber [
	"Default: 1.  Used only by some Node shapes.  The line width of the strokes of a node."

	self optionAt: 'lineWidth' put: aNumber
]

{ #category : #options }
InfoVisNodeOptions >> overridable: aBoolean [
	"Default: false.  Determine whether or not general node properties can be overridden by a particular Graph.Node."

	self optionAt: 'overridable' put: aBoolean
]

{ #category : #options }
InfoVisNodeOptions >> span: aNumber [
	"Default: 1.  Used in radial layouts (like RGraph or Sunburst visualizations).  The angle span amount set for a node."

	self optionAt: 'span' put: aNumber
]

{ #category : #options }
InfoVisNodeOptions >> transform: aBoolean [
	"Default: true.  Only used by the Hypertree visualization.  Whether to scale the nodes according to the moebius transformation."

	self optionAt: 'transform' put: aBoolean
]

{ #category : #options }
InfoVisNodeOptions >> type: aString [
	"Default: circle.  Node's shape.  Node built-in types include 'circle', 'rectangle', 'square', 'ellipse', 'triangle', 'star'.  The default Node type might vary in each visualization.  You can also implement (non built-in) custom Node types into your visualizations."

	self optionAt: 'type' put: aString
]

{ #category : #options }
InfoVisNodeOptions >> width: aNumber [
	"Default: 90.  Used by 'rectangle' and 'ellipse' node types.  The width of the node shape."

	self optionAt: 'width' put: aNumber
]
