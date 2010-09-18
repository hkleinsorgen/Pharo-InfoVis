Class {
	#name : #InfoVisRadialGraphComponent,
	#superclass : #InfoVisRadialComponent,
	#category : 'InfoVis-Examples'
}

{ #category : #rendering }
InfoVisRadialGraphComponent >> createVisualizationFor: html [ 

	| graph |
	graph := html infoVis radialGraph.
	graph 
		levelDistance: 100;
		duration: 500;
		transition: InfoVisTransition quartetic easeInOut.
	graph background canvasStyles strokeStyle: '#666'.
	graph navigationOptions
		panning: true;
		zooming: 30.
	graph nodeOptions
		overridable: true.
	graph edgeOptions
		color: self edgeColor;
		overridable: true.
	graph onCreateLabel: 
		((self labelFunctionFor: graph) asFunction: #(label node)).
	graph onPlaceLabel: 
		((self placeLabelFunctionFor: graph) asFunction: #(label node)).
	self setDefaultOptions: graph.
	^ graph
]

{ #category : #JSON }
InfoVisRadialGraphComponent >> depth [

	^ 8
]

{ #category : #JSON }
InfoVisRadialGraphComponent >> jsonData [

	^ self jsonForClass: self rootClass
]

{ #category : #rendering }
InfoVisRadialGraphComponent >> renderExplanationOn: html [ 

	html 
		render: 'A radial graph visualization. Click on a node to navigate. Pan by dragging the background. Zoom with the mouse wheel.'.
]

{ #category : #rendering }
InfoVisRadialGraphComponent >> renderVisualization: graph on: html [ 

	html div class: self visualizationCssClass;
		script: graph.
	" load data "
	html document addLoadScript: 
		( html jQuery getJson infoVisJson: [ self jsonData ];
			onComplete: 
				graph loadJson, 
				( graph compute: 'end' ) , 
				( graph animateFor: 2000 modes: #( 'polar' ))).
]

{ #category : #accessing }
InfoVisRadialGraphComponent >> title [

	^ 'Radial graph'
]
