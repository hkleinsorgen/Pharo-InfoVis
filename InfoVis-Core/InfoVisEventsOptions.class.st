"
Configuration for adding mouse/touch event handlers to Nodes.
"
Class {
	#name : #InfoVisEventsOptions,
	#superclass : #InfoVisOptions,
	#category : 'InfoVis-Core'
}

{ #category : #accessing }
InfoVisEventsOptions class >> infoVisName [

	^ 'Events'
]

{ #category : #options }
InfoVisEventsOptions >> enable: aBoolean [
	"Default: false.  Whether to enable the Event system."

	self optionAt: 'enable' put: aBoolean
]

{ #category : #options }
InfoVisEventsOptions >> enableForEdges: aBoolean [
	"Default: false.  Whether to track events also in arcs.  If true the same callbacks -described below- are used for nodes and edges.  A simple duck type check for edges is to check for node.nodeFrom."

	self optionAt: 'enableForEdges' put: aBoolean
]

{ #category : #options }
InfoVisEventsOptions >> onClick: aFunction [
	"function arguments: node, eventInfo, e"
	"Triggered when a user performs a click in the canvas.  node is the Graph.Node clicked or false if no node has been clicked.  e is the grabbed event (should return the native event in a cross-browser manner).  eventInfo is an object containing useful methods like getPos to get the mouse position relative to the canvas."

	self optionAt: 'onClick' put: aFunction asFunction
]

{ #category : #options }
InfoVisEventsOptions >> onDragCancel: aFunction [
	"function arguments: node, eventInfo, e"
	"Triggered when the user releases the mouse button over a Graph.Node that wasn't dragged (i.e. the user didn't perform any mouse movement after pressing the mouse button).  node is the Graph.Node being dragged.  e is the grabbed event (should return the native event in a cross-browser manner).  eventInfo is an object containing useful methods like getPos to get the mouse position relative to the canvas."

	self optionAt: 'onDragCancel' put: aFunction asFunction
]

{ #category : #options }
InfoVisEventsOptions >> onDragEnd: aFunction [
	"function arguments: node, eventInfo, e"
	"Triggered when a user finished dragging a node.  node is the Graph.Node being dragged.  e is the grabbed event (should return the native event in a cross-browser manner).  eventInfo is an object containing useful methods like getPos to get the mouse position relative to the canvas."

	self optionAt: 'onDragEnd' put: aFunction asFunction
]

{ #category : #options }
InfoVisEventsOptions >> onDragMove: aFunction [
	"function arguments: node, eventInfo, e"
	"Triggered when a user, after pressing the mouse button over a node, moves the mouse around.  node is the Graph.Node being dragged.  e is the grabbed event (should return the native event in a cross-browser manner).  eventInfo is an object containing useful methods like getPos to get the mouse position relative to the canvas."

	self optionAt: 'onDragMove' put: aFunction asFunction
]

{ #category : #options }
InfoVisEventsOptions >> onDragStart: aFunction [
	"function arguments: node, eventInfo, e"
	"Triggered when the user mouse-downs over a node.  node is the Graph.Node being pressed.  e is the grabbed event (should return the native event in a cross-browser manner).  eventInfo is an object containing useful methods like getPos to get the mouse position relative to the canvas."

	self optionAt: 'onDragStart' put: aFunction asFunction
]

{ #category : #options }
InfoVisEventsOptions >> onMouseEnter: aFunction [
	"function arguments: node, eventInfo, e"
	"Triggered when a user moves the mouse over a node.  node is the Graph.Node that the mouse just entered.  e is the grabbed event (should return the native event in a cross-browser manner).  eventInfo is an object containing useful methods like getPos to get the mouse position relative to the canvas."

	self optionAt: 'onMouseEnter' put: aFunction asFunction
]

{ #category : #options }
InfoVisEventsOptions >> onMouseLeave: aFunction [
	"function arguments: node, eventInfo, e"
	"Triggered when the user mouse-outs a node.  node is the Graph.Node 'mouse-outed'.  e is the grabbed event (should return the native event in a cross-browser manner).  eventInfo is an object containing useful methods like getPos to get the mouse position relative to the canvas."

	self optionAt: 'onMouseLeave' put: aFunction asFunction
]

{ #category : #options }
InfoVisEventsOptions >> onMouseMove: aFunction [
	"function arguments: node, eventInfo, e"
	"Triggered when the user moves the mouse.  node is the Graph.Node under the cursor as it's moving over the canvas or false if no node has been clicked.  e is the grabbed event (should return the native event in a cross-browser manner).  eventInfo is an object containing useful methods like getPos to get the mouse position relative to the canvas."

	self optionAt: 'onMouseMove' put: aFunction asFunction
]

{ #category : #options }
InfoVisEventsOptions >> onMouseWheel: aFunction [
	"function arguments: delta, e"
	"Triggered when the user uses the mouse scroll over the canvas.  delta is 1 or -1 depending on the sense of the mouse scroll."

	self optionAt: 'onMouseWheel' put: aFunction asFunction
]

{ #category : #options }
InfoVisEventsOptions >> onRightClick: aFunction [
	"function arguments: node, eventInfo, e"
	"Triggered when a user performs a right click in the canvas.  node is the Graph.Node right clicked or false if no node has been clicked.  e is the grabbed event (should return the native event in a cross-browser manner).  eventInfo is an object containing useful methods like getPos to get the mouse position relative to the canvas."

	self optionAt: 'onRightClick' put: aFunction asFunction
]

{ #category : #options }
InfoVisEventsOptions >> onTouchCancel: aFunction [
	"function arguments: node, eventInfo, e"
	"Behaves just like onDragCancel."

	self optionAt: 'onTouchCancel' put: aFunction asFunction
]

{ #category : #options }
InfoVisEventsOptions >> onTouchEnd: aFunction [
	"function arguments: node, eventInfo, e"
	"Behaves just like onDragEnd."

	self optionAt: 'onTouchEnd' put: aFunction asFunction
]

{ #category : #options }
InfoVisEventsOptions >> onTouchMove: aFunction [
	"function arguments: node, eventInfo, e"
	"Behaves just like onDragMove."

	self optionAt: 'onTouchMove' put: aFunction asFunction
]

{ #category : #options }
InfoVisEventsOptions >> onTouchStart: aFunction [
	"function arguments: node, eventInfo, e"
	"Behaves just like onDragStart."

	self optionAt: 'onTouchStart' put: aFunction asFunction
]

{ #category : #options }
InfoVisEventsOptions >> type: aString [
	"Default: 'auto'.  Whether to attach the events onto the HTML labels (via event delegation) or to use the custom 'Native' canvas Event System of the library.  'auto' is set when you let the Options.Label type parameter decide this."

	self optionAt: 'type' put: aString
]
