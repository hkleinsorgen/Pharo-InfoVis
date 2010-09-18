Class {
	#name : #InfoVisObject,
	#superclass : #JSObject,
	#instVars : [
		'options'
	],
	#category : 'InfoVis-Core'
}

{ #category : #accessing }
InfoVisObject class >> infoVisName [

	self subclassResponsibility
]

{ #category : #private }
InfoVisObject >> arguments [
	^ options isNil
		ifTrue: [ Array new ]
		ifFalse: [ Array with: options ]
]

{ #category : #private }
InfoVisObject >> infoVis [

	^ (InfoVis context: self renderContext)
		rendererClass: self species;
		yourself
]

{ #category : #private }
InfoVisObject >> optionAt: aKey put: aValue [
	^ self options at: aKey asString put: aValue
]

{ #category : #private }
InfoVisObject >> options [
	^ options ifNil: [ options := GRSmallDictionary new ]
]

{ #category : #private }
InfoVisObject >> optionsObject: anOptionsClass [

	^ self options at: anOptionsClass infoVisName ifAbsentPut: [ anOptionsClass new ]
]
