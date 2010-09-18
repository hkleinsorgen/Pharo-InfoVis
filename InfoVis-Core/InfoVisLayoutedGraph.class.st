"
Abstract superclass for graphs with animated layout algorithms
"
Class {
	#name : #InfoVisLayoutedGraph,
	#superclass : #InfoVisVisualization,
	#category : 'InfoVis-Core'
}

{ #category : #functions }
InfoVisLayoutedGraph >> animate: animationOptions [
	"  Animates a <Graph> by interpolating some <Graph.Node>, <Graph.Adjacence> or <Graph.Label> properties.. "

	^ (self variableAccess access: 'fx' ) call: 'animate' with: animationOptions
]

{ #category : #'functions - convenience' }
InfoVisLayoutedGraph >> animateFor: duration modes: modes [ 

	| animationOptions |
	animationOptions := Dictionary new.
	animationOptions at: 'duration' put: duration;
		at: 'modes' put: modes.
	^ self animate: animationOptions
]

{ #category : #'functions - convenience' }
InfoVisLayoutedGraph >> animateFor: duration transition: transition modes: modes [ 

	| animationOptions |
	animationOptions := Dictionary new.
	animationOptions at: 'duration' put: duration;
		at: 'transition' put: transition;
		at: 'modes' put: modes.
	^ self animate: animationOptions
]

{ #category : #functions }
InfoVisLayoutedGraph >> compute [
	" undocumented function found in some examples "

	^ self variableAccess call: 'compute'
]

{ #category : #functions }
InfoVisLayoutedGraph >> compute: position [
	" undocumented function found in some examples "

	^ self variableAccess call: 'compute' with: position
]

{ #category : #functions }
InfoVisLayoutedGraph >> computeIncremental: incrementalOptions [
	" Performs the layout algorithm incrementally. "

	^ self variableAccess call: 'computeIncremental' with: incrementalOptions
]

{ #category : #'functions - convenience' }
InfoVisLayoutedGraph >> computeIterations: iterations positions: positions onStep: onStepFunction onComplete: onCompleteFunction [ 

	| incrementalOptions |
	incrementalOptions := Dictionary new.
	incrementalOptions at: 'iter' put: iterations;
		at: 'property' put: positions.
	onStepFunction notNil 
		ifTrue: [ incrementalOptions at: 'onStep' put: onStepFunction asFunction ].
	onCompleteFunction notNil 
		ifTrue: [ incrementalOptions at: 'onComplete' put: onCompleteFunction asFunction ].
	^ self computeIncremental: incrementalOptions
]

{ #category : #'functions - convenience' }
InfoVisLayoutedGraph >> enableNodeDragging [

	self eventOptions 
		onDragMove: ( 'var pos = event.getPos();node.pos.setc(pos.x, pos.y);' , self variableNameNeeded , '.plot();' asFunction: #( #node #event e));
		onTouchMove: ( '$jit.util.event.stop(e);this.onDragMove(node, eventInfo, e);' asFunction: #( #node #event e)).
]

{ #category : #'functions - convenience' }
InfoVisLayoutedGraph >> fadeOut: node duration: duration [

	^ (node copy call: 'setData' with: 'alpha' with: 0 with: 'end'), 
		(node copy call: 'eachAdjacency' with: (('adj.setData("alpha", 0, "end")') asFunction: #(adj))),
		(self animateFor: duration modes: #('node-property:alpha' 'edge-property:alpha'))
]

{ #category : #functions }
InfoVisLayoutedGraph >> plot [
	" Plots the visualization.  This is a shortcut to fx.plot."

	^ self variableAccess call: 'plot'
]
