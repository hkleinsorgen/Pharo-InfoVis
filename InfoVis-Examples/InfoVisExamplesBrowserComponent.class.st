Class {
	#name : #InfoVisExamplesBrowserComponent,
	#superclass : #WAComponent,
	#instVars : [
		'exampleComponents',
		'currentComponent'
	],
	#category : 'InfoVis-Examples'
}

{ #category : #'class initialization' }
InfoVisExamplesBrowserComponent class >> initialize [

	| app |
	app := WAAdmin register: self asApplicationAt: 'examples/InfoVis'.
	app addLibrary: InfoVisDevelopmentLibrary.
	app addLibrary: InfoVisExampleLibrary.
	app addLibrary: JQDeploymentLibrary.
	app preferenceAt: #scriptGeneratorClass put: JQScriptGenerator.
	^ app
]

{ #category : #hooks }
InfoVisExamplesBrowserComponent >> children [

	^ self exampleComponents
]

{ #category : #accessing }
InfoVisExamplesBrowserComponent >> currentComponent [

	^ currentComponent ifNil: [ currentComponent := self exampleComponents first ].
]

{ #category : #accessing }
InfoVisExamplesBrowserComponent >> currentComponent: aCurrentComponent [ 

	^ currentComponent := aCurrentComponent
]

{ #category : #accessing }
InfoVisExamplesBrowserComponent >> exampleComponents [

	exampleComponents isNil 
		ifTrue: 
		[	exampleComponents := (( InfoVisExampleComponent allSubclasses reject: [ : class | class isAbstract ]) collect: [: class | class new ]) 
					asSortedCollection: [: c1 : c2 | c1 sortKey <= c2 sortKey ]
		].
	^ exampleComponents
]

{ #category : #rendering }
InfoVisExamplesBrowserComponent >> renderContentOn: html [ 

	html div class: 'content';
		with: 
			[	html div class: 'navigation';
					with: [ self renderNavigationOn: html ].
				html div class: 'example';
					with: [ self renderExampleOn: html ]
			].
]

{ #category : #rendering }
InfoVisExamplesBrowserComponent >> renderExampleOn: html [ 

	self currentComponent ifNotNil: [ : c | c renderOn: html ]
]

{ #category : #rendering }
InfoVisExamplesBrowserComponent >> renderNavigationOn: html [ 

	html heading level2; with:  'InfoVis'.
	html unorderedList class: 'navigation'; with: 
		[	self exampleComponents do: 
				[: component |
					html listItem class: 'navigation'; with: 
						[	html anchor class: ( component = self currentComponent 
											ifTrue: [ 'selection' ]
											ifFalse: [ 'navigation' ]);
								callback: [ self currentComponent: component ];
								with: [ component title renderOn: html ]
						]
				]
		].
]
