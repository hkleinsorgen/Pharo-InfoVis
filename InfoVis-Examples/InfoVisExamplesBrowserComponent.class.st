Class {
	#name : #InfoVisExamplesBrowserComponent,
	#superclass : #WAComponent,
	#instVars : [
		'exampleComponents',
		'currentComponent'
	],
	#category : #'InfoVis-Examples'
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

{ #category : #accessing }
InfoVisExamplesBrowserComponent >> categories [

	^ self exampleComponents keys asSortedCollection
]

{ #category : #hooks }
InfoVisExamplesBrowserComponent >> children [

	| children |
	children := Set new.
	self exampleComponents do: [: components | children addAll: components ].
	^ children
]

{ #category : #accessing }
InfoVisExamplesBrowserComponent >> currentComponent [

	^ currentComponent ifNil: [ currentComponent := (self exampleComponents at: self categories first) first ].
]

{ #category : #accessing }
InfoVisExamplesBrowserComponent >> currentComponent: aCurrentComponent [ 

	^ currentComponent := aCurrentComponent
]

{ #category : #accessing }
InfoVisExamplesBrowserComponent >> exampleComponents [

	exampleComponents isNil 
		ifTrue: 
		[	exampleComponents := Dictionary new.
			( InfoVisExampleComponent allSubclasses reject: [: class | class isAbstract ]) do: 
				[: class | | component components |
					component := class new.
					components := exampleComponents at: component category ifAbsentPut: [ SortedCollection sortBlock: [: c1 : c2 | c1 sortKey <= c2 sortKey ]].
					components add: component
				]
		].
	^ exampleComponents
]

{ #category : #rendering }
InfoVisExamplesBrowserComponent >> renderContentOn: html [ 

	html div class: 'content';
		with: 
			[	html div class: 'navigation';
					with: [ self renderNavigationOn: html ].
				self currentComponent ifNotNil: 
					[: c |
						html div class: 'example';
							with: [ c renderOn: html ]
					]
			].
]

{ #category : #rendering }
InfoVisExamplesBrowserComponent >> renderNavigationOn: html [ 

	html heading level2;
		with: 'InfoVis'.
	self categories do: 
		[: category |
			html heading level3;
				with: category.
			html unorderedList class: 'navigation';
				with: 
					[( self exampleComponents at: category ) do: 
							[: component |
								html listItem class: 'navigation';
									with: [ self renderNavigationTitleOf: component on: html ]
							]
					]
		].
]

{ #category : #rendering }
InfoVisExamplesBrowserComponent >> renderNavigationTitleOf: component on: html [ 

	html anchor class: ( component = self currentComponent 
					ifTrue: [ 'selection' ]
					ifFalse: [ 'navigation' ]);
		callback: [ self currentComponent: component ];
		with: [ component title renderOn: html ].
]
