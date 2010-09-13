Class {
	#name : #InfoVisTransition,
	#superclass : #Object,
	#instVars : [
		'name',
		'type'
	],
	#category : 'InfoVis-Core'
}

{ #category : #transitions }
InfoVisTransition class >> back [

	^ self named: 'Back'
]

{ #category : #transitions }
InfoVisTransition class >> bounce [

	^ self named: 'Bounce'
]

{ #category : #transitions }
InfoVisTransition class >> circular [

	^ self named: 'Circ'
]

{ #category : #transitions }
InfoVisTransition class >> cubic [

	^ self named: 'Cubic'
]

{ #category : #transitions }
InfoVisTransition class >> elastic [

	^ self named: 'Elastic'
]

{ #category : #transitions }
InfoVisTransition class >> exponential [

	^ self named: 'Expo'
]

{ #category : #transitions }
InfoVisTransition class >> linearTransition [

	^ '$jit.Trans.linear'
]

{ #category : #private }
InfoVisTransition class >> named: aString [

	^ self new name: aString; yourself
]

{ #category : #transitions }
InfoVisTransition class >> quadratic [

	^ self named: 'Quad'
]

{ #category : #transitions }
InfoVisTransition class >> quartetic [

	^ self named: 'Quart'
]

{ #category : #transitions }
InfoVisTransition class >> quintic [

	^ self named: 'Quint'
]

{ #category : #transitions }
InfoVisTransition class >> sine [

	^ self named: 'Sine'
]

{ #category : #accessing }
InfoVisTransition >> easeIn [

	^ self type: 'easeIn'
]

{ #category : #accessing }
InfoVisTransition >> easeInOut [

	^ self type: 'easeInOut'
]

{ #category : #accessing }
InfoVisTransition >> easeOut [

	^ self type: 'easeOut'
]

{ #category : #private }
InfoVisTransition >> javascriptContentOn: aStream [

	aStream nextPutAll: '$jit.Trans.'; nextPutAll: name.
	type notNil ifTrue: [ aStream nextPut: $.; nextPutAll: type ].
]

{ #category : #printing }
InfoVisTransition >> javascriptOn: aStream [

	aStream nextPutAll: '$jit.Trans.'; nextPutAll: name.
	type notNil ifTrue: [ aStream nextPut: $.; nextPutAll: type ].
]

{ #category : #private }
InfoVisTransition >> name: aName [ 

	name := aName.
]

{ #category : #printing }
InfoVisTransition >> printOn: aStream [

	aStream nextPutAll: name.
	type notNil ifTrue: [ aStream nextPut: Character space; nextPutAll: type ].
]

{ #category : #private }
InfoVisTransition >> type: aType [

	type := aType
]
