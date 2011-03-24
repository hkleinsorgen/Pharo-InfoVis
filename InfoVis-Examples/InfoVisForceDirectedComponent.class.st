Class {
	#name : #InfoVisForceDirectedComponent,
	#superclass : #InfoVisGraphComponent,
	#category : #'InfoVis-Examples'
}

{ #category : #JSON }
InfoVisForceDirectedComponent >> addStyleOfPackage: data to: package [ 

	( '*-Core*' match: package name ) 
		ifTrue: 
		[	data at: '$color' put: '#44AA88'.
			data at: '$type' put: 'circle'
		]
		ifFalse: 
		[	data at: '$color' put: '#AA6600'.
			data at: '$type' put: 'star'
		].
]

{ #category : #rendering }
InfoVisForceDirectedComponent >> createVisualizationFor: html [ 

	| graph |
	graph := html infoVis forceDirected.
	graph levelDistance: 200.
	graph navigationOptions enablePanningAvoidingNodes;
		zooming: 30.
	graph nodeOptions overridable: true.
	graph edgeOptions
		displayAsArrows;
		dimension: 12;
		alpha: 0.7;
		color: self edgeColor;
		overridable: true.
	graph eventOptions onMouseEnter: ( graph showCursor: 'move' );
		onMouseLeave: graph showNormalCursor;
		onRightClick: (( graph fadeOut: self firstArgument duration: 500 ) asFunction: #( #node )).
	graph enableNodeDragging.
	self setDefaultOptions: graph.
	^ graph
]

{ #category : #JSON }
InfoVisForceDirectedComponent >> edgeForPackage: aPackage [ 

	| edgeData edge |
	edge := Dictionary new.
	edge at: 'nodeTo' put: aPackage name.
	edgeData := Dictionary new.
	edge at: 'data' put: edgeData.
	^ edge
]

{ #category : #JSON }
InfoVisForceDirectedComponent >> includePackage: package [

	^ ( '*-Tests*' match: package name )  not
]

{ #category : #JSON }
InfoVisForceDirectedComponent >> jsonData [

	| graph |
	graph := OrderedCollection new.
	GRPackage packages do: 
		[: package | | node adjacencies |
			( self includePackage: package ) 
				ifTrue: 
				[	node := self nodeForPackage: package.
					adjacencies := (package dependencies 
							select: 	[: dep | self includePackage: dep ] )
							collect: [ : dep | self edgeForPackage: dep ].

					node at: 'adjacencies' put: adjacencies.
					graph add: node
				]
		].
	^ graph
]

{ #category : #options }
InfoVisForceDirectedComponent >> labelColor [

	^ 'black'
]

{ #category : #controls }
InfoVisForceDirectedComponent >> layoutGraph: graph [ 

	^ graph 
		computeIterations: 200
		positions: 'end'
		onStep: nil
		onComplete: ( graph animateFor: 3000 transition: InfoVisTransition elastic easeOut modes: #( 'linear' ))
]

{ #category : #JSON }
InfoVisForceDirectedComponent >> nodeForPackage: package [ 

	| data node |
	node := Dictionary new.
	node at: 'name' put: package name.
	node at: 'id' put: package name.
	data := Dictionary new.
	self addStyleOfPackage: data to: package.
	data at: '$dim' put: 10.
	node at: 'data' put: data.
	^ node
]

{ #category : #rendering }
InfoVisForceDirectedComponent >> renderControlsFor: graph on: html [

	html button
		onClick: (self layoutGraph: graph);
		with: 'Use the force'
]

{ #category : #rendering }
InfoVisForceDirectedComponent >> renderExplanationOn: html [

	html render: 'A graph visualizing the dependencies of Grease packages using a force-directed layout algorithm.. Drag nodes around, or remove them by right-clicking. Zoom with the mouse wheel.'.
]

{ #category : #rendering }
InfoVisForceDirectedComponent >> renderVisualization: graph on: html [ 

	html div class: self visualizationCssClass;
		script: graph.
	" load data "
	html document addLoadScript: 
		( html jQuery getJson infoVisJson: [ self jsonData ];
			onComplete: graph loadJson , ( self layoutGraph: graph )).
]

{ #category : #accessing }
InfoVisForceDirectedComponent >> title [

	^ 'Force directed'
]

{ #category : #rendering }
InfoVisForceDirectedComponent >> toolTipFunction [

	^ 'tip.innerHTML =  "<b>" + node.name + "</b>"' asFunction: #( #tip #node )
]

{ #category : #options }
InfoVisForceDirectedComponent >> visualizationCssClass [

	^ 'InfoVisBright'
]
