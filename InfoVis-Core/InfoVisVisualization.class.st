Class {
	#name : #InfoVisVisualization,
	#superclass : #InfoVisObject,
	#instVars : [
		'jsonData',
		'variableName'
	],
	#category : 'InfoVis-Core'
}

{ #category : #testing }
InfoVisVisualization >> canRefresh [
	" true if refresh() is implemented "

	^ false
]

{ #category : #options }
InfoVisVisualization >> canvasOptions [

	^ self optionsObject: InfoVisCanvasOptions
]

{ #category : #options }
InfoVisVisualization >> controllerOptions [

	^ self optionsObject: InfoVisControllerOptions
]

{ #category : #options }
InfoVisVisualization >> edgeOptions [

	^ self optionsObject: InfoVisEdgeOptions
]

{ #category : #options }
InfoVisVisualization >> eventOptions [

	^ self optionsObject: InfoVisEventOptions
]

{ #category : #options }
InfoVisVisualization >> fxOptions [

	^ self optionsObject: InfoVisFxOptions
]

{ #category : #functions }
InfoVisVisualization >> getLegend [
	" Returns an object containing as keys the legend names and as values hex strings with color values. "

	^ self variableAccess call: 'getLegend'
]

{ #category : #accessing }
InfoVisVisualization >> id: aString [
	" attaches the visualization to a brush "

	self optionAt: 'injectInto' put: aString
]

{ #category : #printing }
InfoVisVisualization >> javascriptContentOn: aStream [ 

	| varJsonName |
	jsonData notNil 
		ifTrue: 
		[	varJsonName := 'json' , self variableName.
			aStream nextPutAll: 'var '; nextPutAll: varJsonName; nextPutAll: '='.
			jsonData jsonOn: aStream.
			aStream nextPutAll: ';'
		].
	aStream nextPutAll: ' var '; nextPutAll: self variableName; nextPutAll: '='.
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

{ #category : #options }
InfoVisVisualization >> labelOptions [

	^ self optionsObject: InfoVisLabelOptions
]

{ #category : #functions }
InfoVisVisualization >> loadJson [
	" assume that the first argument is the JSON data. " 

	^ self loadJson: (JSStream on: 'arguments[0]')
]

{ #category : #functions }
InfoVisVisualization >> loadJson: anObject [
	" Loads JSON data into the visualization. "

	^ self variableAccess call: 'loadJSON' with: anObject
]

{ #category : #options }
InfoVisVisualization >> marginOptions [

	^ self optionsObject: InfoVisMarginOptions
]

{ #category : #options }
InfoVisVisualization >> navigationOptions [

	^ self optionsObject: InfoVisNavigationOptions
]

{ #category : #options }
InfoVisVisualization >> nodeOptions [

	^ self optionsObject: InfoVisNodeOptions
]

{ #category : #options }
InfoVisVisualization >> nodeStylesOptions [

	^ self optionsObject: InfoVisNodeStylesOptions
]

{ #category : #functions }
InfoVisVisualization >> refresh [

	^ self variableAccess call: 'refresh'
]

{ #category : #options }
InfoVisVisualization >> tipsOptions [

	^ self optionsObject: InfoVisTipsOptions
]

{ #category : #options }
InfoVisVisualization >> treeOptions [

	^ self optionsObject: InfoVisTreeOptions
]

{ #category : #functions }
InfoVisVisualization >> updateJson [
	" assume that the first argument is the JSON data. " 

	^ self updateJson: (JSStream on: 'arguments[0]')
]

{ #category : #functions }
InfoVisVisualization >> updateJson: anObject [
	" Use this method when updating values for the current JSON data.  If the items specified by the JSON data already exist in the graph then their values will be updated. "
	^ self variableAccess call: 'updateJSON' with: anObject
]

{ #category : #private }
InfoVisVisualization >> variableAccess [

	^ self copy jsonData: nil; alias: self variableName
]

{ #category : #accessing }
InfoVisVisualization >> variableName [

	variableName isNil 
		ifTrue: [ variableName := 'infoVis' , self renderContext callbacks advanceKey ].
	^ variableName
]
