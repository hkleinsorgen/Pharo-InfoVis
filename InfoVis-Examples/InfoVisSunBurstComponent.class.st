Class {
	#name : #InfoVisSunBurstComponent,
	#superclass : #InfoVisExampleComponent,
	#instVars : [
		'links',
		'nextID',
		'classes'
	],
	#category : 'InfoVis-Examples'
}

{ #category : #JSON }
InfoVisSunBurstComponent >> classes [

	classes isNil ifTrue: [ classes := Dictionary new: 1000 ].
	^ classes
]

{ #category : #JSON }
InfoVisSunBurstComponent >> colorOfClass: aClass [ 

	^ aClass isVariable 
		ifTrue: [ '#AAFFAA' ]
		ifFalse: 
		[	aClass instSize > 0  
				ifTrue: [ '#EECCAA' ]
				ifFalse: [ '#AACCFF' ]
		]
]

{ #category : #JSON }
InfoVisSunBurstComponent >> commentOfClass: aClass [ 

	| comment |
	comment := aClass comment ifNil: [ '' ].
	^ comment size > 80 
		ifTrue: [( comment copyFrom: 1 to: 80 ) , '...' ]
		ifFalse: [ comment ]
]

{ #category : #JSON }
InfoVisSunBurstComponent >> jsonData [

	^ self jsonForClass: Collection
]

{ #category : #JSON }
InfoVisSunBurstComponent >> jsonDataForLink: aString [
	
	| class |
	class := self links at: aString.
	^ self jsonForClass: class
]

{ #category : #JSON }
InfoVisSunBurstComponent >> jsonForClass: aClass [ 

	^ self jsonForClass: aClass depth: 2
]

{ #category : #JSON }
InfoVisSunBurstComponent >> jsonForClass: aClass depth: depth [ 

	| data children object classSize |
	data := Dictionary new.
	classSize := 0.
	aClass allSubclassesDo: [: s | classSize := classSize + 1 ].
	data at: '$angularWidth' put: classSize.
	data at: '$color' put: ( self colorOfClass: aClass ).
	data at: 'comment' put: ( self commentOfClass: aClass ).
	data at: 'link' put: ( self linkToClass: aClass ).
	children := depth > 0 
			ifTrue: 
			[( aClass subclasses asSortedCollection: [: c1 : c2 | c1 name <= c2 name ]) collect: [: c | self jsonForClass: c depth: depth - 1 ]
			]
			ifFalse: [ #( )].
	object := Dictionary new.
	object at: 'name' put: aClass name.
	object at: 'id' put: aClass name.
	object at: 'data' put: data.
	object at: 'children' put: children.
	^ object
]

{ #category : #options }
InfoVisSunBurstComponent >> labelSize [

	^ 10
]

{ #category : #JSON }
InfoVisSunBurstComponent >> linkToClass: aClass [ 

	^ self classes at: aClass ifAbsentPut: [
		| link |
		nextID := nextID isNil 
				ifTrue: [ 1 ]
				ifFalse: [ nextID + 1 ].
		link := nextID printString.
		self links at: link put: aClass.
		link
	].
]

{ #category : #JSON }
InfoVisSunBurstComponent >> links [

	links isNil ifTrue: [ links := Dictionary new: 1000 ].
	^ links
]

{ #category : #rendering }
InfoVisSunBurstComponent >> renderExampleOn: html [ 

	| sunBurst |
	sunBurst := html infoVis sunBurst.
	sunBurst jsonData: self jsonData;
		levelDistance: 100;
		displayMultipieWithGradients.
	sunBurst nodeOptions overridable: true.
	sunBurst eventOptions 
		onClick: ( 
			sunBurst 
				rotate: self firstArgument 
				duration: 1000 
				transition: InfoVisTransition quartetic easeInOut 
			) asFunction;
		onRightClick: ( 
			html jQuery getJson 
				infoVisJson: [ : className | self jsonDataForLink: className ]
					value: (JSStream on: 'arguments[0].data.link');
				onComplete: sunBurst loadJson, sunBurst refresh).
	self setDefaultOptions: sunBurst.
	html div class: self visualizationCssClass;
		script: sunBurst.
]

{ #category : #rendering }
InfoVisSunBurstComponent >> renderExplanationOn: html [

	html render: 'A radial space filling tree visualization. Different colors represent different types of classes (indexed, instVars)'.
	html paragraph: 'Left click on a class pie to rotate the sunburst, right click to dive'.
]

{ #category : #accessing }
InfoVisSunBurstComponent >> title [

	^  'Sunburst'
]

{ #category : #rendering }
InfoVisSunBurstComponent >> toolTipFunction [

	^ 'tip.innerHTML =  "<b>" + node.name + "</b><p/>" + node.data.comment' asFunction: #( #tip #node )
]
