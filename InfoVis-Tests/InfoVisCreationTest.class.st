Class {
	#name : #InfoVisCreationTest,
	#superclass : #InfoVisTest,
	#category : 'InfoVis-Tests'
}

{ #category : #private }
InfoVisCreationTest >> create: selector expect: aJavascriptClassName [

	| visual |
	visual := self infoVis perform: selector.
	visual variableName: 'v'.
	self 
		assert: visual
		equals: 'var v=new $jit.', aJavascriptClassName,'()'
]

{ #category : #tests }
InfoVisCreationTest >> testAreaChart [

	self create: #areaChart expect: 'AreaChart'
]

{ #category : #tests }
InfoVisCreationTest >> testBarChart [

	self create: #barChart expect: 'BarChart'
]

{ #category : #tests }
InfoVisCreationTest >> testForceDirected [

	self create: #forceDirected expect: 'ForceDirected'
]

{ #category : #tests }
InfoVisCreationTest >> testHyperTee [

	self create: #hyperTree expect: 'Hypertree'
]

{ #category : #tests }
InfoVisCreationTest >> testIcicle [

	self create: #icicle expect: 'Icicle'
]

{ #category : #tests }
InfoVisCreationTest >> testPieChart [

	self create: #pieChart expect: 'PieChart'
]

{ #category : #tests }
InfoVisCreationTest >> testRadialGraph [

	self create: #radialGraph expect: 'RGraph'
]

{ #category : #tests }
InfoVisCreationTest >> testSliceAndDice [

	self create: #sliceAndDice expect: 'TM.SliceAndDice'
]

{ #category : #tests }
InfoVisCreationTest >> testSpaceTree [

	self create: #spaceTree expect: 'ST'
]

{ #category : #tests }
InfoVisCreationTest >> testSquarified [

	self create: #squarified expect: 'TM.Squarified'
]

{ #category : #tests }
InfoVisCreationTest >> testStrip [

	self create: #strip expect: 'TM.Strip'
]

{ #category : #tests }
InfoVisCreationTest >> testSunBurst [

	self create: #sunBurst expect: 'Sunburst'
]
