Class {
	#name : #InfoVisExampleComponent,
	#superclass : #WAComponent,
	#instVars : [
		'passengers',
		'passengerIDs',
		'nextID'
	],
	#category : 'InfoVis-Examples'
}

{ #category : #'instance creation' }
InfoVisExampleComponent class >> isAbstract [

	^ self = InfoVisExampleComponent
]

{ #category : #accessing }
InfoVisExampleComponent >> category [

	self subclassResponsibility
]

{ #category : #private }
InfoVisExampleComponent >> colorHue: h saturation: s brightness: b [

	| i f m n k |
	i := (h * 6) truncated.
	f := h * 6 - i.
	m := b * (1.0 - s).
	n := b * (1.0 - (s * f)).
	k := b * (1.0 - (s * (1.0 - f))).
	i = 1 ifTrue: [^self colorRed: n green: b blue: m].
	i = 2 ifTrue: [^self colorRed: m green: b blue: k].
	i = 3 ifTrue: [^self colorRed: m green: n blue: b].
	i = 4 ifTrue: [^self colorRed: k green: m blue: b].
	i = 5 ifTrue: [^self colorRed: b green: m blue: n].
	^self colorRed: b green: k blue: m
]

{ #category : #JSON }
InfoVisExampleComponent >> colorOfClass: aClass size: size [

	| saturation hue |
	hue := 197 / 360.
	^ size > 0 
		ifTrue: 
		[	saturation := size / 10 + 0.3 min: 1.
			self colorHue: hue saturation: saturation brightness: 0.87
		]
		ifFalse: [ self colorHue: hue saturation: 0.2 brightness: 0.5 ]
]

{ #category : #private }
InfoVisExampleComponent >> colorRed: r green: g blue: b [ 

	^ String streamContents: 
		[: stream |
			stream nextPut: $#.
			stream nextPutAll: (((r * 256) floor min: 255) printPaddedWith: $0 to: 2 base: 16).
			stream nextPutAll: (((g * 256) floor min: 255) printPaddedWith: $0 to: 2 base: 16).
			stream nextPutAll: (((b * 256) floor min: 255) printPaddedWith: $0 to: 2 base: 16).
		]
]

{ #category : #rendering }
InfoVisExampleComponent >> createVisualizationFor: html [ 
	" create and return a InfoVis visualization "

	self subclassResponsibility
]

{ #category : #private }
InfoVisExampleComponent >> firstArgument [

	^ JSStream on: 'arguments[0]'
]

{ #category : #passengers }
InfoVisExampleComponent >> idForPassenger: anObject [ 

	^ self passengerIDs at: anObject ifAbsentPut: [
		| id |
		nextID := nextID isNil 
				ifTrue: [ 1 ]
				ifFalse: [ nextID + 1 ].
		id := nextID printString.
		self passengers at: id put: anObject.
		id
	].
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

{ #category : #options }
InfoVisExampleComponent >> labelColor [

	^ 'white'
]

{ #category : #options }
InfoVisExampleComponent >> labelSize [
	" size (px) of labels displayed in the visualization "

	^ 13
]

{ #category : #passengers }
InfoVisExampleComponent >> passengerAt: id [

	^ self passengers at: id ifAbsent: [ nil ]
]

{ #category : #passengers }
InfoVisExampleComponent >> passengerIDs [

	passengerIDs isNil ifTrue: [ passengerIDs := Dictionary new: 1000 ].
	^ passengerIDs
]

{ #category : #passengers }
InfoVisExampleComponent >> passengers [

	passengers isNil ifTrue: [ passengers := Dictionary new: 1000 ].
	^ passengers
]

{ #category : #rendering }
InfoVisExampleComponent >> renderContentOn: html [ 

	| visualization |
	self renderTitleOn: html.
	self renderExplanationOn: html.
	visualization := self createVisualizationFor: html .
	self renderSourceAndControlsFor: visualization on: html .
	html paragraph: [ self renderVisualization: visualization on: html ].
]

{ #category : #rendering }
InfoVisExampleComponent >> renderControlsFor: visualization on: html [
	" render additional buttons "
]

{ #category : #rendering }
InfoVisExampleComponent >> renderExplanationOn: html [
]

{ #category : #rendering }
InfoVisExampleComponent >> renderSourceAndControlsFor: visualization on: html [ 

	| selectors codeID |
	selectors := self sourceSelectors.
	codeID := html nextId.
	html paragraph: 
		[	self renderControlsFor: visualization on: html.
			html submitButton onClick: (( html jQuery id: codeID ) slideToggle: 500 );
				value: 'Toggle source'
		].
	html div id: codeID;
		class: 'hidden';
		with: [ selectors do: [: selector | self renderSourceOf: selector on: html ]].
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
InfoVisExampleComponent >> renderTitleOn: html [

	html heading level2; with: self title.
]

{ #category : #rendering }
InfoVisExampleComponent >> renderVisualization: aVisualization on: html [
]

{ #category : #options }
InfoVisExampleComponent >> setDefaultLabelOptions: aVisualisation [ 

	aVisualisation labelOptions
		renderNative;
		size: self labelSize;
		family: 'sans-serif';
		color: self labelColor.
]

{ #category : #options }
InfoVisExampleComponent >> setDefaultOptions: aVisualisation [ 

	aVisualisation marginOptions
		top: 5;
		left: 5;
		right: 5;
		bottom: 5.
	self setDefaultLabelOptions: aVisualisation.
	self toolTipFunction ifNotNil: 
		[: toolTipFunction |
			aVisualisation tipOptions renderLikeLabels;
				enable: true;
				onShow: toolTipFunction
		].
]

{ #category : #accessing }
InfoVisExampleComponent >> sortKey [

	^ self title
]

{ #category : #accessing }
InfoVisExampleComponent >> sourceSelectors [

	^ #(#createVisualizationFor: renderVisualization:on:)
]

{ #category : #hooks }
InfoVisExampleComponent >> states [

	^ Array with: passengers with: passengerIDs with: nextID
]

{ #category : #accessing }
InfoVisExampleComponent >> title [

	self subclassResponsibility
]

{ #category : #rendering }
InfoVisExampleComponent >> toolTipFunction [

	^ nil
]

{ #category : #options }
InfoVisExampleComponent >> visualizationCssClass [

	^ 'InfoVis'
]
