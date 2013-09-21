Class {
	#name : #InfoVisGraphComponent,
	#superclass : #InfoVisExampleComponent,
	#category : #'InfoVis-Examples'
}

{ #category : #'instance creation' }
InfoVisGraphComponent class >> isAbstract [

	^ self == InfoVisGraphComponent
]

{ #category : #accessing }
InfoVisGraphComponent >> category [

	^ 'Graphs and trees'
]

{ #category : #JSON }
InfoVisGraphComponent >> colorOfClass: aClass [ 

	| size |
	size := aClass allSubclasses size.
	^ self colorOfClass: aClass size: size
]

{ #category : #JSON }
InfoVisGraphComponent >> depth [

	^ 20
]

{ #category : #options }
InfoVisGraphComponent >> edgeColor [

	^ '#0088CC'
]

{ #category : #JSON }
InfoVisGraphComponent >> jsonForClass: aClass [ 

	^ self jsonForClass: aClass depth: self depth
]

{ #category : #JSON }
InfoVisGraphComponent >> jsonForClass: aClass depth: depth [ 

	| data children object |
	data := Dictionary new.
	data at: '$color' put: ( self colorOfClass: aClass ).
	children := depth > 0 
			ifTrue: [
				( aClass subclasses asSortedCollection: [: c1 : c2 | c1 name <= c2 name ])
					collect: [: c | self jsonForClass: c depth: depth - 1 ]
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
InfoVisGraphComponent >> rootClass [

	^ Collection
]
