Class {
	#name : #InfoVisGraphComponent,
	#superclass : #InfoVisExampleComponent,
	#category : 'InfoVis-Examples'
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

	| size saturation hue |
	size := aClass allSubclasses size.
	hue := 197 / 360.
	^ size > 0 
		ifTrue: 
		[	saturation := size / 10 + 0.3 min: 1.
			self colorHue: hue saturation: saturation brightness: 0.87
		]
		ifFalse: [ self colorHue: hue saturation: 0.2 brightness: 0.5 ]
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
