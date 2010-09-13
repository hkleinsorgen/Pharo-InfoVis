Extension { #name : #JQAjax }

{ #category : #'*InfoVis-Examples' }
JQAjax >> infoVisJson: aJsonBlock [

	self dataType: 'json'.
	self respond: [ :response |
		response
			doNotCache; 
			contentType: (WAMimeType textJavascript
				charset: self requestContext handler charSet).
		aJsonBlock value jsonOn: response stream ]
]

{ #category : #'*InfoVis-Examples' }
JQAjax >> infoVisJson: aJsonBlock value: aValue [
	" evaluate the block with the velue sent from the client, and respond with JSON data "

	| blockArgument |
	self dataType: 'json'.
	blockArgument := nil.
	self respond: [ :response |
		response
			doNotCache; 
			contentType: (WAMimeType textJavascript
				charset: self requestContext handler charSet).
		 response stream nextPutAll: (aJsonBlock cull: blockArgument) asJson ].
	self addParameter: (self renderContext callbacks
		store: (WAValueCallback on: [ : argument | blockArgument := argument ])) 
			-> aValue
]
