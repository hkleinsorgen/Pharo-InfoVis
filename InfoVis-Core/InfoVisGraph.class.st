Class {
	#name : #InfoVisGraph,
	#superclass : #InfoVisVisualization,
	#category : 'InfoVis-Core'
}

{ #category : #functions }
InfoVisGraph >> animate: animationOptions [
	"  Animates a <Graph> by interpolating some <Graph.Node>, <Graph.Adjacence> or <Graph.Label> properties.. "

	^ self variableAccess call: 'animate' with: animationOptions
]

{ #category : #'functions - convenience' }
InfoVisGraph >> animateFor: duration modes: modes [ 

	| animationOptions |
	animationOptions := Dictionary new.
	animationOptions at: 'duration' put: duration;
		at: 'modes' put: modes.
	^ self animate: animationOptions
]

{ #category : #'functions - convenience' }
InfoVisGraph >> animateFor: duration transition: transition modes: modes [ 

	| animationOptions |
	animationOptions := Dictionary new.
	animationOptions at: 'duration' put: duration;
		at: 'transition' put: transition;
		at: 'modes' put: modes.
	^ self animate: animationOptions
]

{ #category : #functions }
InfoVisGraph >> computeIncremental: incrementalOptions [
	" Performs the layout algorithm incrementally. "

	^ self variableAccess call: 'computeIncremental' with: incrementalOptions
]

{ #category : #'functions - convenience' }
InfoVisGraph >> computeIterations: iterations positions: positions onStep: onStepFunction onComplete: onCompleteFunction [ 

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
InfoVisGraph >> enableNodeDragging [

	self eventOptions 
		onDragMove: ( 'var pos = event.getPos();node.pos.setc(pos.x, pos.y);' , self variableNameNeeded , '.plot();' asFunction: #( #node #event e));
		onTouchMove: ( '$jit.util.event.stop(e);this.onDragMove(node, eventInfo, e);' asFunction: #( #node #event e)).
]

{ #category : #'functions - convenience' }
InfoVisGraph >> fadeOut: node duration: duration [

	^ (node copy call: 'setData' with: 'alpha' with: 0 with: 'end'), 
		(node copy call: 'eachAdjacency' with: (('adj.setData("alpha", 0, "end")') asFunction: #(adj))),
		(self animateFor: duration modes: #('node-property:alpha' 'edge-property:alpha'))
]

{ #category : #functions }
InfoVisGraph >> plot [
	" Plots the visualization.  This is a shortcut to fx.plot."

	^ self variableAccess call: 'plot'
]
