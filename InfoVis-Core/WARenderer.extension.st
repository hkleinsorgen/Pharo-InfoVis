Extension { #name : #WARenderer }

{ #category : #'*InfoVis-Core' }
WARenderer >> infoVis [

	^ (InfoVis context: self context)
		rendererClass: self species;
		yourself
]

{ #category : #'*InfoVis-Core' }
WARenderer >> urlForInfoVisJsonCallback: aBlock [ 

	^ self actionUrl withField: ( self callbacks store: ( JSAjaxCallback on: aBlock ))
]
