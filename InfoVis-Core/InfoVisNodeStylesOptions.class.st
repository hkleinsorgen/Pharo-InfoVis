"
Apply different styles when a node is hovered or selected
"
Class {
	#name : #InfoVisNodeStylesOptions,
	#superclass : #InfoVisOptions,
	#category : 'InfoVis-Core'
}

{ #category : #accessing }
InfoVisNodeStylesOptions class >> infoVisName [

	^ 'NodeStyles'
]

{ #category : #options }
InfoVisNodeStylesOptions >> enable: aBoolean [
	"Default: false.  Whether to enable this option."

	self optionAt: 'enable' put: aBoolean
]

{ #category : #'options - convenience' }
InfoVisNodeStylesOptions >> renderAsHtml [

	self type: 'HTML'
]

{ #category : #'options - convenience' }
InfoVisNodeStylesOptions >> renderAsSvg [

	self type: 'SVG'
]

{ #category : #'options - convenience' }
InfoVisNodeStylesOptions >> renderLikeLabels [

	self type: 'auto'
]

{ #category : #'options - convenience' }
InfoVisNodeStylesOptions >> renderNative [

	self type: 'Native'
]

{ #category : #options }
InfoVisNodeStylesOptions >> stylesClick: aBooleanOrObject [
	"Default: false.  An object with node styles just like the ones defined for Options.Node or false otherwise."

	self optionAt: 'stylesClick' put: aBooleanOrObject
]

{ #category : #options }
InfoVisNodeStylesOptions >> stylesHover: aBooleanOrObject [
	"Default: false.  An object with node styles just like the ones defined for Options.Node or false otherwise."

	self optionAt: 'stylesHover' put: aBooleanOrObject
]

{ #category : #options }
InfoVisNodeStylesOptions >> type: aString [
	"Default: auto.  Use this to attach the hover/click events in the nodes or the nodes labels (if they have been defined as DOM elements: 'HTML' or 'SVG', see Options.Label for more details).  The default 'auto' value will set NodeStyles to the same type defined for Options.Label."

	self optionAt: 'type' put: aString
]
