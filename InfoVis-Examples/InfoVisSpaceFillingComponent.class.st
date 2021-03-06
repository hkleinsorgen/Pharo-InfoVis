Class {
	#name : #InfoVisSpaceFillingComponent,
	#superclass : #InfoVisExampleComponent,
	#category : #''
}

{ #category : #'instance creation' }
InfoVisSpaceFillingComponent class >> isAbstract [

	^ self = InfoVisSpaceFillingComponent
]

{ #category : #JSON }
InfoVisSpaceFillingComponent >> addSize: classSize toData: data [
]

{ #category : #accessing }
InfoVisSpaceFillingComponent >> category [

	^ 'Space filling trees'
]

{ #category : #JSON }
InfoVisSpaceFillingComponent >> colorOfClass: aClass size: size [

	| saturation hue |
	hue := 197 / 360.
	^ size > 0 
		ifTrue: 
		[	saturation := size / 10 + 0.3 min: 1.
			self colorHue: hue saturation: saturation brightness: 0.87
		]
		ifFalse: [ self colorHue: hue saturation: 0.2 brightness: 0.5 ]
]

{ #category : #JSON }
InfoVisSpaceFillingComponent >> commentOfClass: aClass [ 

	| comment |
	comment := aClass comment ifNotNil: [ : c | c asString ] ifNil: [ '' ].
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

	| data children object classSize superclass |
	data := Dictionary new.
	classSize := 1.
	aClass allSubclassesDo: [: s | classSize := classSize + 1 ].
	self addSize: classSize toData: data.
	data at: '$color' put: ( self colorOfClass: aClass size: classSize ).
	superclass := aClass = self rootClass 
			ifTrue: [ aClass ]
			ifFalse: [ aClass superclass ].
	data at: 'parentId' put: ( self idForPassenger: superclass ).
	data at: 'comment' put: ( self commentOfClass: aClass ).
	children := depth > 0 
			ifTrue: 
			[( aClass subclasses asSortedCollection: [: c1 : c2 | c1 name <= c2 name ]) collect: [: c | self jsonForClass: c depth: depth - 1 ]
			]
			ifFalse: [ #( )].
	object := Dictionary new.
	object at: 'name' put: aClass name.
	object at: 'id' put: ( self idForPassenger: aClass ).
	object at: 'data' put: data.
	object at: 'children' put: children.
	^ object
]

{ #category : #JSON }
InfoVisSpaceFillingComponent >> jsonForID: aString [
	
	| class |
	class := self passengerAt: aString.
	^ self jsonForClass: class
]

{ #category : #options }
InfoVisSpaceFillingComponent >> labelSize [

	^ 10
]

{ #category : #JSON }
InfoVisSpaceFillingComponent >> rootClass [

	^ Collection
]

{ #category : #rendering }
InfoVisSpaceFillingComponent >> toolTipFunction [

	^ 'tip.innerHTML =  "<b>" + node.name + "</b><p/>" + node.data.comment' asFunction: #( #tip #node )
]
