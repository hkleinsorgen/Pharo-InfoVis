Class {
	#name : #InfoVisSpaceFillingComponent,
	#superclass : #InfoVisExampleComponent,
	#instVars : [
		'links',
		'nextID',
		'classes'
	],
	#category : 'InfoVis-Examples'
}

{ #category : #'instance creation' }
InfoVisSpaceFillingComponent class >> isAbstract [

	^ self = InfoVisSpaceFillingComponent
]

{ #category : #JSON }
InfoVisSpaceFillingComponent >> addSize: data toData: classSize [ 

	self subclassResponsibility
]

{ #category : #accessing }
InfoVisSpaceFillingComponent >> category [

	^ 'Space filling trees'
]

{ #category : #private }
InfoVisSpaceFillingComponent >> classes [

	classes isNil ifTrue: [ classes := Dictionary new: 1000 ].
	^ classes
]

{ #category : #options }
InfoVisSpaceFillingComponent >> colorOfClass: aClass [ 

	^ aClass isBits 
		ifTrue: [ '#5B69FF' ]
		ifFalse: 
		[	aClass isVariable
				ifTrue: [ '#5BB5FF' ]
				ifFalse: [ '#47C676' ]
		]
]

{ #category : #private }
InfoVisSpaceFillingComponent >> commentOfClass: aClass [ 

	| comment |
	comment := aClass comment ifNil: [ '' ].
	^ comment size > 80 
		ifTrue: [( comment copyFrom: 1 to: 80 ) , '...' ]
		ifFalse: [ comment ]
]

{ #category : #JSON }
InfoVisSpaceFillingComponent >> depth [

	self subclassResponsibility
]

{ #category : #JSON }
InfoVisSpaceFillingComponent >> jsonForClass: aClass [ 

	^ self jsonForClass: aClass depth: self depth
]

{ #category : #JSON }
InfoVisSpaceFillingComponent >> jsonForClass: aClass depth: depth [ 

	| data children object classSize |
	data := Dictionary new.
	classSize := 1.
	aClass allSubclassesDo: [: s | classSize := classSize + 1 ].
	self addSize: data toData: classSize.
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

{ #category : #JSON }
InfoVisSpaceFillingComponent >> jsonForLink: aString [
	
	| class |
	class := self links at: aString.
	^ self jsonForClass: class
]

{ #category : #options }
InfoVisSpaceFillingComponent >> labelSize [

	^ 10
]

{ #category : #private }
InfoVisSpaceFillingComponent >> linkToClass: aClass [ 

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

{ #category : #private }
InfoVisSpaceFillingComponent >> links [

	links isNil ifTrue: [ links := Dictionary new: 1000 ].
	^ links
]

{ #category : #rendering }
InfoVisSpaceFillingComponent >> toolTipFunction [

	^ 'tip.innerHTML =  "<b>" + node.name + "</b><p/>" + node.data.comment' asFunction: #( #tip #node )
]
