Extension { #name : #WARenderer }

{ #category : #'*InfoVis-Core' }
WARenderer >> infoVis [
	" returns a facade for objects and utility functions provided by the InfoVis library "

	^ (InfoVis context: self context)
		rendererClass: self species;
		yourself
]

{ #category : #'*InfoVis-Core' }
WARenderer >> urlForInfoVisJsonCallback: aBlock [ 

	^ self actionUrl withField: ( self callbacks store: ( JSAjaxCallback on: aBlock ))
]
