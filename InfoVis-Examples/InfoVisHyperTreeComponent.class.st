Class {
	#name : #InfoVisHyperTreeComponent,
	#superclass : #InfoVisRadialComponent,
	#category : 'InfoVis-Examples'
}

{ #category : #rendering }
InfoVisHyperTreeComponent >> createVisualizationFor: html [ 

	| graph |
	graph := html infoVis hyperTree.
	graph 
		duration: 500;
		transition: InfoVisTransition quartetic easeInOut.
	graph navigationOptions
		zooming: 30.
	graph nodeOptions
		dimension: 9;
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
InfoVisHyperTreeComponent >> jsonData [

	^ self jsonForClass: self rootClass
]

{ #category : #rendering }
InfoVisHyperTreeComponent >> renderExplanationOn: html [ 

	html 
		render: 'A hyperbolic tree visualization. Click on a node to navigate.'.
]

{ #category : #rendering }
InfoVisHyperTreeComponent >> renderVisualization: graph on: html [ 

	html div class: self visualizationCssClass;
		script: graph.
	" load data "
	html document addLoadScript: 
		( html jQuery getJson infoVisJson: [ self jsonData ];
			onComplete: 
				graph loadJson, 
				( graph compute: 'end' ) , 
				( graph animateFor: 1000 modes: #( 'polar' ))).
]

{ #category : #accessing }
InfoVisHyperTreeComponent >> title [

	^ 'Hyper tree'
]
