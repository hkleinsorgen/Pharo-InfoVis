"
Configuration for adding mouse/touch event handlers to Nodes.
"
Class {
	#name : #InfoVisEventOptions,
	#superclass : #InfoVisOptions,
	#category : 'InfoVis-Core'
}

{ #category : #accessing }
InfoVisEventOptions class >> infoVisName [

	^ 'Events'
]

{ #category : #options }
InfoVisEventOptions >> enable: aBoolean [
	"Default: false.  Whether to enable the Event system."

	self optionAt: 'enable' put: aBoolean
]

{ #category : #options }
InfoVisEventOptions >> enableForEdges: aBoolean [
	"Default: false.  Whether to track events also in arcs.  If true the same callbacks -described below- are used for nodes and edges.  A simple duck type check for edges is to check for node.nodeFrom."

	self optionAt: 'enableForEdges' put: aBoolean
]

{ #category : #options }
InfoVisEventOptions >> onClick: aFunction [
	"function arguments: node, eventInfo, e"
	"Triggered when a user performs a click in the canvas.  node is the Graph.Node clicked or false if no node has been clicked.  e is the grabbed event (should return the native event in a cross-browser manner).  eventInfo is an object containing useful methods like getPos to get the mouse position relative to the canvas."

	self enable: true.
	self optionAt: 'onClick' put: aFunction asFunction
]

{ #category : #options }
InfoVisEventOptions >> onDragCancel: aFunction [
	"function arguments: node, eventInfo, e"
	"Triggered when the user releases the mouse button over a Graph.Node that wasn't dragged (i.e. the user didn't perform any mouse movement after pressing the mouse button).  node is the Graph.Node being dragged.  e is the grabbed event (should return the native event in a cross-browser manner).  eventInfo is an object containing useful methods like getPos to get the mouse position relative to the canvas."

	self enable: true.
	self optionAt: 'onDragCancel' put: aFunction asFunction
]

{ #category : #options }
InfoVisEventOptions >> onDragEnd: aFunction [
	"function arguments: node, eventInfo, e"
	"Triggered when a user finished dragging a node.  node is the Graph.Node being dragged.  e is the grabbed event (should return the native event in a cross-browser manner).  eventInfo is an object containing useful methods like getPos to get the mouse position relative to the canvas."

	self enable: true.
	self optionAt: 'onDragEnd' put: aFunction asFunction
]

{ #category : #options }
InfoVisEventOptions >> onDragMove: aFunction [
	"function arguments: node, eventInfo, e"
	"Triggered when a user, after pressing the mouse button over a node, moves the mouse around.  node is the Graph.Node being dragged.  e is the grabbed event (should return the native event in a cross-browser manner).  eventInfo is an object containing useful methods like getPos to get the mouse position relative to the canvas."

	self enable: true.
	self optionAt: 'onDragMove' put: aFunction asFunction
]

{ #category : #options }
InfoVisEventOptions >> onDragStart: aFunction [
	"function arguments: node, eventInfo, e"
	"Triggered when the user mouse-downs over a node.  node is the Graph.Node being pressed.  e is the grabbed event (should return the native event in a cross-browser manner).  eventInfo is an object containing useful methods like getPos to get the mouse position relative to the canvas."

	self enable: true.
	self optionAt: 'onDragStart' put: aFunction asFunction
]

{ #category : #options }
InfoVisEventOptions >> onMouseEnter: aFunction [
	"function arguments: node, eventInfo, e"
	"Triggered when a user moves the mouse over a node.  node is the Graph.Node that the mouse just entered.  e is the grabbed event (should return the native event in a cross-browser manner).  eventInfo is an object containing useful methods like getPos to get the mouse position relative to the canvas."

	self enable: true.
	self optionAt: 'onMouseEnter' put: aFunction asFunction
]

{ #category : #options }
InfoVisEventOptions >> onMouseLeave: aFunction [
	"function arguments: node, eventInfo, e"
	"Triggered when the user mouse-outs a node.  node is the Graph.Node 'mouse-outed'.  e is the grabbed event (should return the native event in a cross-browser manner).  eventInfo is an object containing useful methods like getPos to get the mouse position relative to the canvas."

	self enable: true.
	self optionAt: 'onMouseLeave' put: aFunction asFunction
]

{ #category : #options }
InfoVisEventOptions >> onMouseMove: aFunction [
	"function arguments: node, eventInfo, e"
	"Triggered when the user moves the mouse.  node is the Graph.Node under the cursor as it's moving over the canvas or false if no node has been clicked.  e is the grabbed event (should return the native event in a cross-browser manner).  eventInfo is an object containing useful methods like getPos to get the mouse position relative to the canvas."

	self enable: true.
	self optionAt: 'onMouseMove' put: aFunction asFunction
]

{ #category : #options }
InfoVisEventOptions >> onMouseWheel: aFunction [
	"function arguments: delta, e"
	"Triggered when the user uses the mouse scroll over the canvas.  delta is 1 or -1 depending on the sense of the mouse scroll."

	self enable: true.
	self optionAt: 'onMouseWheel' put: aFunction asFunction
]

{ #category : #options }
InfoVisEventOptions >> onRightClick: aFunction [
	"function arguments: node, eventInfo, e"
	"Triggered when a user performs a right click in the canvas.  node is the Graph.Node right clicked or false if no node has been clicked.  e is the grabbed event (should return the native event in a cross-browser manner).  eventInfo is an object containing useful methods like getPos to get the mouse position relative to the canvas."

	self enable: true.
	self optionAt: 'onRightClick' put: aFunction asFunction
]

{ #category : #options }
InfoVisEventOptions >> onTouchCancel: aFunction [
	"function arguments: node, eventInfo, e"
	"Behaves just like onDragCancel."

	self enable: true.
	self optionAt: 'onTouchCancel' put: aFunction asFunction
]

{ #category : #options }
InfoVisEventOptions >> onTouchEnd: aFunction [
	"function arguments: node, eventInfo, e"
	"Behaves just like onDragEnd."

	self enable: true.
	self optionAt: 'onTouchEnd' put: aFunction asFunction
]

{ #category : #options }
InfoVisEventOptions >> onTouchMove: aFunction [
	"function arguments: node, eventInfo, e"
	"Behaves just like onDragMove."

	self enable: true.
	self optionAt: 'onTouchMove' put: aFunction asFunction
]

{ #category : #options }
InfoVisEventOptions >> onTouchStart: aFunction [
	"function arguments: node, eventInfo, e"
	"Behaves just like onDragStart."

	self enable: true.
	self optionAt: 'onTouchStart' put: aFunction asFunction
]

{ #category : #options }
InfoVisEventOptions >> type: aString [
	"Default: 'auto'.  Whether to attach the events onto the HTML labels (via event delegation) or to use the custom 'Native' canvas Event System of the library.  'auto' is set when you let the Options.Label type parameter decide this."

	self optionAt: 'type' put: aString
]
