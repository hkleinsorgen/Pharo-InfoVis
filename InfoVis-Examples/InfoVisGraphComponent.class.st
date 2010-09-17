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

	^ 'Graphs'
]
