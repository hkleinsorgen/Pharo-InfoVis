Class {
	#name : #InfoVisOverviewComponent,
	#superclass : #InfoVisExampleComponent,
	#category : 'InfoVis-Examples'
}

{ #category : #rendering }
InfoVisOverviewComponent >> renderExplanationOn: html [

	html text: 'InfoVis is a data visualization library created by Nicolas Garcia Belmonte. For more information, visit the InfoVis Toolkit homepage: '.
	html anchor
		url: 'http://thejit.org';
		target: '_new';
		with: 'thejit.org'.
]

{ #category : #accessing }
InfoVisOverviewComponent >> sortKey [

	^ ''
]

{ #category : #accessing }
InfoVisOverviewComponent >> sourceSelectors [

	^ #()
]

{ #category : #accessing }
InfoVisOverviewComponent >> title [

	^ 'Overview'
]