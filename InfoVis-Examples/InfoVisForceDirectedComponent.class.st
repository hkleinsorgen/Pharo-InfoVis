Class {
	#name : #InfoVisForceDirectedComponent,
	#superclass : #InfoVisGraphComponent,
	#category : 'InfoVis-Examples'
}

{ #category : #accessing }
InfoVisForceDirectedComponent >> addStyleOfPackage: data to: package [ 

	( '*-Tests*' match: package name ) 
		ifTrue: 
		[	data at: '$color' put: '#006600'.
			data at: '$type' put: 'star'
		]
		ifFalse: 
		[( '*-Core*' match: package name ) 
				ifTrue: 
				[	data at: '$color' put: '#006666'.
					data at: '$type' put: 'circle'
				]
				ifFalse: 
				[	data at: '$color' put: '#660000'.
					data at: '$type' put: 'triangle'
				]
		].
]

{ #category : #accessing }
InfoVisForceDirectedComponent >> jsonData [

	| graph |
	graph := OrderedCollection new.
	GRPackage packages do: 
		[: package | | node adjacencies data |
			node := Dictionary new.
			node at: 'name' put: package name.
			node at: 'id' put: package name.
			data := Dictionary new.
			self addStyleOfPackage: data to: package.
			data at: '$dim' put: 10.
			node at: 'data' put: data.
			adjacencies := package dependencies collect: 
				[: dep | | edge edgeData |
					edge := Dictionary new.
					edge at: 'nodeTo' put: dep name.
					edgeData := Dictionary new.
					edgeData at: '$color' put: '#0066AA'.
					edge at: 'data' put: edgeData.
					edge
				].
			node at: 'adjacencies' put: adjacencies.
			graph add: node
		].
	^ graph
]

{ #category : #rendering }
InfoVisForceDirectedComponent >> renderExampleOn: html [ 

	| graph |
	graph := html infoVis forceDirected.
	graph levelDistance: 250.
	graph navigationOptions 
		enablePanningAvoidingNodes; 
		zooming: 30.
	graph nodeOptions overridable: true.
	graph edgeOptions 
		displayAsArrows; 
		dim: 12; 
		alpha: 0.7;
		overridable: true.
	graph eventOptions
		onMouseEnter: (graph cursor: 'move');
		onMouseLeave: (graph cursor: '');
		onRightClick: ((graph fadeOut: (JSStream on: 'node') duration: 500) asFunction: #(node)).
	graph enableNodeDragging.
	self setDefaultOptions: graph.
	html div class: self visualizationCssClass;
		script: graph.
	" load data "
	html document addLoadScript: 
		( html jQuery getJson infoVisJson: [ self jsonData ];
			onComplete: graph loadJson, 
				(graph computeIterations: 200 positions: 'end' onStep: nil onComplete: 
					(graph animateFor: 3000 transition: InfoVisTransition elastic easeOut modes: #('linear')))).
]

{ #category : #rendering }
InfoVisForceDirectedComponent >> renderExplanationOn: html [

	html render: 'A graph visualizing the dependencies of Grease packages. Drag nodes around, or remove them by right-clicking. Zoom with the mouse wheel.'.
]

{ #category : #accessing }
InfoVisForceDirectedComponent >> title [

	^ 'Force directed'
]

{ #category : #rendering }
InfoVisForceDirectedComponent >> toolTipFunction [

	^ 'tip.innerHTML =  "<b>" + node.name + "</b>"' asFunction: #( #tip #node )
]
