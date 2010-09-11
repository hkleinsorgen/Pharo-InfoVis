"
Panning and zooming options for Graph/Tree based visualizations.  These options are implemented by all visualizations except charts (AreaChart, BarChart and PieChart).
"
Class {
	#name : #InfoVisNavigationOptions,
	#superclass : #InfoVisOptions,
	#category : 'InfoVis-Core'
}

{ #category : #accessing }
InfoVisNavigationOptions class >> infoVisName [

	^ 'Navigation'
]

{ #category : #options }
InfoVisNavigationOptions >> enable: aBoolean [
	"Default: false.  Whether to enable Navigation capabilities."

	self optionAt: 'enable' put: aBoolean
]

{ #category : #options }
InfoVisNavigationOptions >> panning: aBooleanOrString [
	"Default: false.  Set this property to true if you want to add Drag and Drop panning support to the visualization.  You can also set this parameter to 'avoid nodes' to enable DnD panning but disable it if the DnD is taking place over a node.  This is useful when some other events like Drag & Drop for nodes are added to Graph.Nodes."

	self optionAt: 'panning' put: aBooleanOrString
]

{ #category : #options }
InfoVisNavigationOptions >> zooming: aBooleanOrNumber [
	"Default: false.  Set this property to a numeric value to turn mouse-scroll zooming on.  The number will be proportional to the mouse-scroll sensitivity."

	self optionAt: 'zooming' put: aBooleanOrNumber
]
