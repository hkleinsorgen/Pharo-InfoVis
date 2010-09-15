Class {
	#name : #InfoVisTest,
	#superclass : #JSObjectTest,
	#category : 'InfoVis-Tests'
}

{ #category : #accessing }
InfoVisTest >> infoVis [

	^ (InfoVis context: self renderContext)
		rendererClass: self species;
		yourself
]
