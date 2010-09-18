Class {
	#name : #InfoVisCanvasStyles,
	#superclass : #InfoVisOptions,
	#category : 'InfoVis-Core'
}

{ #category : #accessing }
InfoVisCanvasStyles class >> infoVisName [

	^ 'CanvasStyles'
]

{ #category : #options }
InfoVisCanvasStyles >> fillStyle: aColor [

	self optionAt: 'fillStyle' put: aColor
]

{ #category : #options }
InfoVisCanvasStyles >> globalAlpha: aNumber [

	self optionAt: 'globalAlpha' put: aNumber
]

{ #category : #options }
InfoVisCanvasStyles >> lineWidth: aNumber [

	self optionAt: 'lineWidth' put: aNumber
]

{ #category : #options }
InfoVisCanvasStyles >> miterLimit: aNumber [

	self optionAt: 'miterLimit' put: aNumber
]

{ #category : #options }
InfoVisCanvasStyles >> shadowBlur: aNumber [

	self optionAt: 'shadowBlur' put: aNumber
]

{ #category : #options }
InfoVisCanvasStyles >> shadowColor: aNumber [

	self optionAt: 'shadowColor' put: aNumber
]

{ #category : #options }
InfoVisCanvasStyles >> shadowOffsetX: aNumber [

	self optionAt: 'shadowOffsetX' put: aNumber
]

{ #category : #options }
InfoVisCanvasStyles >> shadowOffsetY: aNumber [

	self optionAt: 'shadowOffsetY' put: aNumber
]

{ #category : #options }
InfoVisCanvasStyles >> strokeStyle: aColor [

	self optionAt: 'strokeStyle' put: aColor
]
