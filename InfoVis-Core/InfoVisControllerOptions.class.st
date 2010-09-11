"
Provides controller methods.  Controller methods are callback functions that get called at different stages of the animation, computing or plotting of the visualization.
"
Class {
	#name : #InfoVisControllerOptions,
	#superclass : #InfoVisOptions,
	#category : 'InfoVis-Core'
}

{ #category : #accessing }
InfoVisControllerOptions class >> infoVisName [

	^ 'Controller'
]

{ #category : #options }
InfoVisControllerOptions >> onAfterCompute: aFunction [
	"function arguments: "
	"This method is triggered after all animations or computations ended."

	self optionAt: 'onAfterCompute' put: aFunction asFunction
]

{ #category : #options }
InfoVisControllerOptions >> onAfterPlotLine: aFunction [
	"function arguments: adj"
	"This method is triggered right after plotting a Graph.Adjacence."

	self optionAt: 'onAfterPlotLine' put: aFunction asFunction
]

{ #category : #options }
InfoVisControllerOptions >> onAfterPlotNode: aFunction [
	"function arguments: node"
	"This method is triggered right after plotting each Graph.Node."

	self optionAt: 'onAfterPlotNode' put: aFunction asFunction
]

{ #category : #options }
InfoVisControllerOptions >> onBeforeCompute: aFunction [
	"function arguments: node"
	"This method is called right before performing all computations and animations.  The selected Graph.Node is passed as parameter."

	self optionAt: 'onBeforeCompute' put: aFunction asFunction
]

{ #category : #options }
InfoVisControllerOptions >> onBeforePlotLine: aFunction [
	"function arguments: adj"
	"This method is triggered right before plotting a Graph.Adjacence.  This method is useful for adding some styles to a particular edge before being plotted."

	self optionAt: 'onBeforePlotLine' put: aFunction asFunction
]

{ #category : #options }
InfoVisControllerOptions >> onBeforePlotNode: aFunction [
	"function arguments: node"
	"This method is triggered right before plotting each Graph.Node.  This method is useful for changing a node style right before plotting it."

	self optionAt: 'onBeforePlotNode' put: aFunction asFunction
]

{ #category : #options }
InfoVisControllerOptions >> onCreateLabel: aFunction [
	"function arguments: domElement, node"
	"This method receives a new label DIV element as first parameter, and the corresponding Graph.Node as second parameter.  This method will only be called once for each label.  This method is useful when adding events or styles to the labels used by the JIT."

	self optionAt: 'onCreateLabel' put: aFunction asFunction
]

{ #category : #options }
InfoVisControllerOptions >> onPlaceLabel: aFunction [
	"function arguments: domElement, node"
	"This method receives a label DIV element as first parameter and the corresponding Graph.Node as second parameter.  This method is called each time a label has been placed in the visualization, for example at each step of an animation, and thus it allows you to update the labels properties, such as size or position.  Note that onPlaceLabel will be triggered after updating the labels positions.  That means that, for example, the left and top css properties are already updated to match the nodes positions.  Width and height properties are not set however."

	self optionAt: 'onPlaceLabel' put: aFunction asFunction
]

{ #category : #options }
InfoVisControllerOptions >> request: aFunction [
	"function arguments: nodeId, level, onComplete"
	"This method is used for buffering information into the visualization.  When clicking on an empty node, the visualization will make a request for this node's subtrees, specifying a given level for this subtree (defined by levelsToShow).  Once the request is completed, the onComplete callback should be called with the given result.  This is useful to provide on-demand information into the visualizations withought having to load the entire information from start.  The parameters used by this method are nodeId, which is the id of the root of the subtree to request, level which is the depth of the subtree to be requested (0 would mean just the root node).  onComplete is an object having the callback method onComplete.onComplete(json)  that should be called once the json has been retrieved."

	self optionAt: 'request' put: aFunction asFunction
]
