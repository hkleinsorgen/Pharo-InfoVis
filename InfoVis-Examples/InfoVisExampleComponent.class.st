Class {
	#name : #InfoVisExampleComponent,
	#superclass : #WAComponent,
	#category : 'InfoVis-Examples'
}

{ #category : '*InfoVis-Examples' }
InfoVisExampleComponent class >> isAbstract [

	^ self = InfoVisExampleComponent
]

{ #category : #JSON }
InfoVisExampleComponent >> jsonUrlFor: aBlock canvas: canvas [ 

	^ canvas urlForInfoVisJsonCallback: 
		[	self requestContext respond: 
				[: response |
					response cacheFor: ( Duration days: 0 hours: 0 minutes: 0 seconds: 1 );
						document: aBlock value mimeType: WAMimeType textJavascript
				].
		]
]

{ #category : #rendering }
InfoVisExampleComponent >> renderContentOn: html [ 

	self renderTitleOn: html.
	self renderExplanationOn: html.
	self renderSourceOn: html .
	html paragraph: [ self renderExampleOn: html ].
]

{ #category : #rendering }
InfoVisExampleComponent >> renderExampleOn: html [
]

{ #category : #rendering }
InfoVisExampleComponent >> renderExplanationOn: html [
]

{ #category : #rendering }
InfoVisExampleComponent >> renderSourceOf: selector on: html [ 

	| selectorString source readStream formattedSource |
	( self class includesSelector: selector ) 
		ifFalse: [ ^ self ].
	source := self class sourceCodeAt: selector.
	source notNil 
		ifTrue: 
		[	readStream := source readStream.
			selectorString := self class name , '>>' , ( readStream upTo: Character cr ) , ( String with: Character cr ).
			formattedSource := String new writeStream.
			[ readStream atEnd ] whileFalse: 
				[ | char |
					char := readStream next.
					char = Character tab 
						ifTrue: [ formattedSource nextPutAll: '  ' ]
						ifFalse: [ formattedSource nextPut: char ]
				].
			html div class: 'code';
				with: 
					[	html preformatted: 
							[	html strong: selectorString.
								html text: formattedSource contents
							]
					]
		].
]

{ #category : #rendering }
InfoVisExampleComponent >> renderSourceOn: html [ 

	| selectors label |
	selectors := self sourceSelectors.
	selectors do: 
		[: selector | | codeID |
			codeID := html nextId.
			html paragraph: 
				[	label := 'Toggle source'.
					selectors size > 1 
						ifTrue: [ label := label , ': ' , selector ].
					html submitButton onClick: (( html jQuery id: codeID ) slideToggle: 500 );
						value: label
				].
			html div id: codeID;
				class: 'hidden';
				with: [ self renderSourceOf: selector on: html ]
		].
]

{ #category : #rendering }
InfoVisExampleComponent >> renderTitleOn: html [

	html heading level2; with: self title.
]

{ #category : #private }
InfoVisExampleComponent >> setDefaultOptions: aVisualisation [

	aVisualisation marginOptions
		top: 5;
		left: 5;
		right: 5;
		bottom: 5.
	aVisualisation labelOptions 
		renderNative;
		size: 13;
		family: 'sans-serif';
		color: 'white'.
	aVisualisation tipsOptions 
		renderLikeLabels;
		enable: true;
		onShow: self toolTipFunction.
]

{ #category : #accessing }
InfoVisExampleComponent >> sortKey [

	^ self title
]

{ #category : #accessing }
InfoVisExampleComponent >> sourceSelectors [

	^ #(#renderExampleOn:)
]

{ #category : #accessing }
InfoVisExampleComponent >> title [

	self subclassResponsibility
]

{ #category : #private }
InfoVisExampleComponent >> toolTipFunction [

	^ ( JSStream on: 'tip.innerHTML = element.name + ": " + element.value' ) asFunction: #( #tip #element )
]
