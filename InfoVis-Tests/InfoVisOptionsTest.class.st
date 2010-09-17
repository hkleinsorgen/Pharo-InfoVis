Class {
	#name : #InfoVisOptionsTest,
	#superclass : #InfoVisTest,
	#category : 'InfoVis-Tests'
}

{ #category : #private }
InfoVisOptionsTest >> options: optionsSelector category: optionsKey set: optionName to: optionValue [ 

	self options: optionsSelector category: optionsKey set: optionName to: optionValue enable: false
]

{ #category : #private }
InfoVisOptionsTest >> options: optionsSelector category: optionsKey set: optionName to: optionValue enable: enable [ 

	| visual expectedPartialOptions expectedOptions optionsCategory |
	visual := self infoVis areaChart.
	optionsCategory := visual perform: optionsSelector.
	optionsCategory perform: ( optionName , ':' ) asSymbol with: optionValue.
	visual variableName: 'v'.
	expectedPartialOptions := GRSmallDictionary new.
	enable 
		ifTrue: 
		[	" setting the options also enables category "
			expectedPartialOptions at: 'enable' put: true
		].
	expectedPartialOptions at: optionName put: optionValue.
	self assert: optionsCategory options equals: expectedPartialOptions asJavascript.
	expectedOptions := GRSmallDictionary new at: optionsKey put: expectedPartialOptions;
			yourself.
	self assert: visual options equals: expectedOptions asJavascript.
	self assert: visual equals: 'var v=new $jit.AreaChart(' , expectedOptions asJavascript , ')'.
]

{ #category : #tests }
InfoVisOptionsTest >> testCanvasOptions [

	| visual javascript |
	visual := self infoVis areaChart.
	visual height: 200.
	visual variableName: 'v'.
	javascript := visual options asJavascript.
	self assert: ('{*height*:200}' match: javascript).
	self 
		assert: visual
		equals: 'var v=new $jit.AreaChart(', javascript, ')'
]

{ #category : #tests }
InfoVisOptionsTest >> testControllerOptions [

	self options: #controllerOptions category: 'Controller' set: 'onAfterCompute' to: 1 asFunction.
]

{ #category : #tests }
InfoVisOptionsTest >> testEdgeOptions [

	self options: #edgeOptions category: 'Edge' set: 'overridable' to: true.
]

{ #category : #tests }
InfoVisOptionsTest >> testEventOptions [

	self options: #eventOptions category: 'Events' set: 'onTouchMove' to: 2 asFunction enable: true
]

{ #category : #tests }
InfoVisOptionsTest >> testFx [

	self options: #fxOptions category: 'Fx' set: 'duration' to: 2000.
]

{ #category : #tests }
InfoVisOptionsTest >> testLabelOptions [

	self options: #labelOptions category: 'Label' set: 'color' to: '#EEE'
]

{ #category : #tests }
InfoVisOptionsTest >> testMarginOptions [

	self options: #marginOptions category: 'Margin' set: 'left' to: 5
]

{ #category : #tests }
InfoVisOptionsTest >> testNavigationOptions [

	self options: #navigationOptions category: 'Navigation' set: 'zooming' to: 10 enable: true
]

{ #category : #tests }
InfoVisOptionsTest >> testNodeOptions [

	self options: #nodeOptions category: 'Node' set: 'align' to: 'left'
]

{ #category : #tests }
InfoVisOptionsTest >> testNodeStylesOptions [

	self options: #nodeStyleOptions category: 'NodeStyles' set: 'type' to: 'HTML' enable: true
]

{ #category : #tests }
InfoVisOptionsTest >> testNodeTipsOptions [

	self options: #tipOptions category: 'Tips' set: 'offsetX' to: 40 enable: true
]

{ #category : #tests }
InfoVisOptionsTest >> testTreeOptions [

	self options: #treeOptions category: 'Tree' set: 'orientation' to: 'left'
]

{ #category : #tests }
InfoVisOptionsTest >> testVisualizationOptions [

	| visual javascript |
	visual := self infoVis areaChart.
	visual animate: true.
	visual variableName: 'v'.
	javascript := visual options asJavascript.
	" compatibility issue: keys dont need to be quoted "
	self assert: ('{*animate*:true}' match: javascript).
	self 
		assert: visual
		equals: 'var v=new $jit.AreaChart(', javascript, ')'
]
