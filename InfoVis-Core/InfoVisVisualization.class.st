"
InfoVisVisualization has not been commented.  The comment should state the purpose of the class and also explain any unobvious aspects of the implementation.

Instance Variables:
	jsonData	<Object>	Optional object that provides the initial JSON data
	variableName	<String>	Javascript variable that is assigned to the visualization object


"
Class {
	#name : #InfoVisVisualization,
	#superclass : #InfoVisObject,
	#instVars : [
		'jsonData',
		'variableName'
	],
	#category : 'InfoVis-Core'
}

{ #category : #'options - canvas' }
InfoVisVisualization >> background [
	" An object containing information about the rendering of a background canvas."

	^ self optionsObject: InfoVisBackground
]

{ #category : #'options - canvas' }
InfoVisVisualization >> background: aBooleanOrObject [
	"Default: false.  An object containing information about the rendering of a background canvas."

	self optionAt: 'background' put: aBooleanOrObject
]

{ #category : #testing }
InfoVisVisualization >> canRefresh [
	" true if refresh() is implemented "

	^ false
]

{ #category : #'options - fx' }
InfoVisVisualization >> clearCanvas: aBoolean [
	"Default: true.  Whether to clear the frame/canvas when the viz is plotted or animated."

	self optionAt: 'clearCanvas' put: aBoolean
]

{ #category : #private }
InfoVisVisualization >> createVariable [
	" the variable the holds the visualization object "

	^ variableName := 'infoVis' , self renderContext callbacks advanceKey
]

{ #category : #'options - fx' }
InfoVisVisualization >> duration: aNumber [
	"Default: 2500.  Duration of the animation in milliseconds."

	self optionAt: 'duration' put: aNumber
]

{ #category : #'options - categories' }
InfoVisVisualization >> edgeOptions [

	^ self optionsObject: InfoVisEdgeOptions
]

{ #category : #'options - categories' }
InfoVisVisualization >> eventOptions [

	^ self optionsObject: InfoVisEventOptions
]

{ #category : #private }
InfoVisVisualization >> firstArgument [
	" accesses the first argument - useful for event handling "

	^ JSStream on: 'arguments[0]'
]

{ #category : #'options - fx' }
InfoVisVisualization >> fps: aNumber [
	"Default: 40.  Frames per second."

	self optionAt: 'fps' put: aNumber
]

{ #category : #'options - canvas' }
InfoVisVisualization >> height: aNumber [
	"Default: to the container's offsetHeight.  The height of the canvas."

	self optionAt: 'height' put: aNumber
]

{ #category : #accessing }
InfoVisVisualization >> id: aString [
	" attaches the visualization to a brush "

	self variableNameNeeded.
	self injectInto: aString
]

{ #category : #'options - canvas' }
InfoVisVisualization >> injectInto: aStringOrElement [
	"Required. The id of the DOM container for the visualization.  It can also be an Element provided that it has an id."

	" Note: automatically set when attaching the visualization to a brush "

	self optionAt: 'injectInto' put: aStringOrElement
]

{ #category : #printing }
InfoVisVisualization >> javascriptContentOn: aStream [ 

	| varJsonName |
	jsonData notNil 
		ifTrue: 
		[	varJsonName := 'json' , self variableNameNeeded.
			aStream nextPutAll: 'var '; nextPutAll: varJsonName; nextPutAll: '='.
			jsonData jsonOn: aStream.
			aStream nextPutAll: '; '
		].
	self variableName notNil 
		ifTrue: [ aStream nextPutAll: 'var '; nextPutAll: self variableName; nextPutAll: '=' ].
	aStream nextPutAll: 'new $jit.'; nextPutAll: self class infoVisName.
	JSStream encodeArguments: self arguments on: aStream.
	jsonData notNil 
		ifTrue: 
		[	aStream nextPutAll: ';'.
			( self loadJson: ( JSStream on: varJsonName )) javascriptOn: aStream.
		].
]

{ #category : #accessing }
InfoVisVisualization >> jsonData: aDataCollection [ 
	" data that is visualized. 
	this is a static setter that is only used when creating the visualization object.
	a more versatile approach is to load the data with a separate request " 

	jsonData := aDataCollection.
]

{ #category : #'options - categories' }
InfoVisVisualization >> labelOptions [

	^ self optionsObject: InfoVisLabelOptions
]

{ #category : #functions }
InfoVisVisualization >> loadJson [
	" assume that the first argument is the JSON data. "

	^ self loadJson: self firstArgument
]

{ #category : #functions }
InfoVisVisualization >> loadJson: anObject [
	" Loads JSON data into the visualization. "

	^ self variableAccess call: 'loadJSON' with: anObject
]

{ #category : #'options - categories' }
InfoVisVisualization >> marginOptions [

	^ self optionsObject: InfoVisMarginOptions
]

{ #category : #'options - categories' }
InfoVisVisualization >> navigationOptions [

	^ self optionsObject: InfoVisNavigationOptions
]

{ #category : #'options - categories' }
InfoVisVisualization >> nodeOptions [

	^ self optionsObject: InfoVisNodeOptions
]

{ #category : #'options - categories' }
InfoVisVisualization >> nodeStyleOptions [

	^ self optionsObject: InfoVisNodeStylesOptions
]

{ #category : #'options - controller' }
InfoVisVisualization >> onAfterCompute: aFunction [
	"function arguments: "
	"This method is triggered after all animations or computations ended."

	self optionAt: 'onAfterCompute' put: aFunction asFunction
]

{ #category : #'options - controller' }
InfoVisVisualization >> onAfterPlotLine: aFunction [
	"function arguments: adj"
	"This method is triggered right after plotting a Graph.Adjacence."

	self optionAt: 'onAfterPlotLine' put: aFunction asFunction
]

{ #category : #'options - controller' }
InfoVisVisualization >> onAfterPlotNode: aFunction [
	"function arguments: node"
	"This method is triggered right after plotting each Graph.Node."

	self optionAt: 'onAfterPlotNode' put: aFunction asFunction
]

{ #category : #'options - controller' }
InfoVisVisualization >> onBeforeCompute: aFunction [
	"function arguments: node"
	"This method is called right before performing all computations and animations.  The selected Graph.Node is passed as parameter."

	self optionAt: 'onBeforeCompute' put: aFunction asFunction
]

{ #category : #'options - controller' }
InfoVisVisualization >> onBeforePlotLine: aFunction [
	"function arguments: adj"
	"This method is triggered right before plotting a Graph.Adjacence.  This method is useful for adding some styles to a particular edge before being plotted."

	self optionAt: 'onBeforePlotLine' put: aFunction asFunction
]

{ #category : #'options - controller' }
InfoVisVisualization >> onBeforePlotNode: aFunction [
	"function arguments: node"
	"This method is triggered right before plotting each Graph.Node.  This method is useful for changing a node style right before plotting it."

	self optionAt: 'onBeforePlotNode' put: aFunction asFunction
]

{ #category : #'options - controller' }
InfoVisVisualization >> onCreateLabel: aFunction [
	"function arguments: domElement, node"
	"This method receives a new label DIV element as first parameter, and the corresponding Graph.Node as second parameter.  This method will only be called once for each label.  This method is useful when adding events or styles to the labels used by the JIT."

	self optionAt: 'onCreateLabel' put: aFunction asFunction
]

{ #category : #'options - controller' }
InfoVisVisualization >> onPlaceLabel: aFunction [
	"function arguments: domElement, node"
	"This method receives a label DIV element as first parameter and the corresponding Graph.Node as second parameter.  This method is called each time a label has been placed in the visualization, for example at each step of an animation, and thus it allows you to update the labels properties, such as size or position.  Note that onPlaceLabel will be triggered after updating the labels positions.  That means that, for example, the left and top css properties are already updated to match the nodes positions.  Width and height properties are not set however."

	self optionAt: 'onPlaceLabel' put: aFunction asFunction
]

{ #category : #functions }
InfoVisVisualization >> refresh [
	" note: implemented by many, but not all visualizations - see #canRefresh "

	^ self variableAccess call: 'refresh'
]

{ #category : #'options - controller' }
InfoVisVisualization >> request: aFunction [
	"function arguments: nodeId, level, onComplete"
	"This method is used for buffering information into the visualization.  When clicking on an empty node, the visualization will make a request for this node's subtrees, specifying a given level for this subtree (defined by levelsToShow).  Once the request is completed, the onComplete callback should be called with the given result.  This is useful to provide on-demand information into the visualizations withought having to load the entire information from start.  The parameters used by this method are nodeId, which is the id of the root of the subtree to request, level which is the depth of the subtree to be requested (0 would mean just the root node).  onComplete is an object having the callback method onComplete.onComplete(json)  that should be called once the json has been retrieved."

	self optionAt: 'request' put: aFunction asFunction
]

{ #category : #'functions - convenience' }
InfoVisVisualization >> showCursor: shape [
	" change the shape of the cursor "

	^ (((((self variableAccess access: 'canvas') call: 'getElement')) access: 'style') access: 'cursor') assign: shape
]

{ #category : #'functions - convenience' }
InfoVisVisualization >> showNormalCursor [
	" reset the shape of the cursor "

	^ self showCursor: ''
]

{ #category : #'options - categories' }
InfoVisVisualization >> tipOptions [

	^ self optionsObject: InfoVisTipsOptions
]

{ #category : #'options - fx' }
InfoVisVisualization >> transition: aObject [
	"Default: $jit.Trans.Quart.easeInOut.  The transition used for the animations.  See below for a more detailed explanation."

	self optionAt: 'transition' put: aObject
]

{ #category : #'options - categories' }
InfoVisVisualization >> treeOptions [

	^ self optionsObject: InfoVisTreeOptions
]

{ #category : #functions }
InfoVisVisualization >> updateJson [
	" assume that the first argument is the JSON data. "

	^ self updateJson: self firstArgument
]

{ #category : #functions }
InfoVisVisualization >> updateJson: anObject [
	" Use this method when updating values for the current JSON data.  If the items specified by the JSON data already exist in the graph then their values will be updated. "

	^ self variableAccess call: 'updateJSON' with: anObject
]

{ #category : #'options - canvas' }
InfoVisVisualization >> useCanvas: aBooleanOrObject [
	"Default: false.  You can pass another Canvas instance to be used by the visualization."

	self optionAt: 'useCanvas' put: aBooleanOrObject
]

{ #category : #private }
InfoVisVisualization >> variableAccess [

	" a cheesy way to access the variable "
	^ (self infoVis create: self class) alias: self variableNameNeeded
]

{ #category : #accessing }
InfoVisVisualization >> variableName [
	" the variable the holds the visualization object "

	^ variableName
]

{ #category : #private }
InfoVisVisualization >> variableName: aString [

	variableName := aString
]

{ #category : #private }
InfoVisVisualization >> variableNameNeeded [

	^ self variableName ifNil: [ self createVariable ]
]

{ #category : #'options - canvas' }
InfoVisVisualization >> width: aNumber [
	"Default: to the container's offsetWidth.  The width of the canvas."

	self optionAt: 'width' put: aNumber
]

{ #category : #'options - canvas' }
InfoVisVisualization >> withLabels: aBoolean [
	"Default: true.  Whether to use a label container for the visualization."

	self optionAt: 'withLabels' put: aBoolean
]
