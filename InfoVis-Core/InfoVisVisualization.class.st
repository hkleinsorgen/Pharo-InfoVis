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
InfoVisVisualization >> background: aBooleanOrObject [
	"Default: false.  An object containing information about the rendering of a background canvas."

	self optionAt: 'background' put: aBooleanOrObject
]

{ #category : #testing }
InfoVisVisualization >> canRefresh [
	" true if refresh() is implemented "

	^ false
]

{ #category : #'options - categories' }
InfoVisVisualization >> controllerOptions [

	^ self optionsObject: InfoVisControllerOptions
]

{ #category : #private }
InfoVisVisualization >> createVariable [
	" the variable the holds the visualization object "

	^ variableName := 'infoVis' , self renderContext callbacks advanceKey
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

{ #category : #'options - categories' }
InfoVisVisualization >> fxOptions [

	^ self optionsObject: InfoVisFxOptions
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
			self canRefresh 
				ifTrue: 
				[	aStream nextPutAll: ';'.
					self refresh javascriptOn: aStream
				]
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
InfoVisVisualization >> nodeStylesOptions [

	^ self optionsObject: InfoVisNodeStylesOptions
]

{ #category : #functions }
InfoVisVisualization >> refresh [
	" note: implemented by many, but not all visualizations - see #canRefresh "

	^ self variableAccess call: 'refresh'
]

{ #category : #'options - categories' }
InfoVisVisualization >> tipsOptions [

	^ self optionsObject: InfoVisTipsOptions
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

	^ self copy jsonData: nil; alias: self variableNameNeeded
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
