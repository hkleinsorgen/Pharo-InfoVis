"
Provides styling for Labels such as font size, family, etc.  Also sets Node labels as HTML, SVG or Native canvas elements.
"
Class {
	#name : #InfoVisLabelOptions,
	#superclass : #InfoVisOptions,
	#category : 'InfoVis-Core'
}

{ #category : '*InfoVis-Core' }
InfoVisLabelOptions class >> infoVisName [

	^ 'Label'
]

{ #category : #options }
InfoVisLabelOptions >> color: aString [
	"Default: #fff.  The font's color.  This parameter is only taken into account when using 'Native' canvas labels.  For DOM based labels the className node is added to the DOM element for styling via CSS.  You can also use Options.Controller methods to style individual labels."

	self optionAt: 'color' put: aString
]

{ #category : #options }
InfoVisLabelOptions >> family: aString [
	"Default: sans-serif.  The font's family.  This parameter is only taken into account when using 'Native' canvas labels.  For DOM based labels the className node is added to the DOM element for styling via CSS.  You can also use Options.Controller methods to style individual labels."

	self optionAt: 'family' put: aString
]

{ #category : #options }
InfoVisLabelOptions >> overridable: aBoolean [
	"Default: false.  Determine whether or not general label properties can be overridden by a particular Graph.Node."

	self optionAt: 'overridable' put: aBoolean
]

{ #category : #'options - convenience' }
InfoVisLabelOptions >> renderAsHtml [

	self type: 'HTML'
]

{ #category : #'options - convenience' }
InfoVisLabelOptions >> renderAsSvg [

	self type: 'SVG'
]

{ #category : #'options - convenience' }
InfoVisLabelOptions >> renderNative [

	self type: 'Native'
]

{ #category : #options }
InfoVisLabelOptions >> size: aNumber [
	"Default: 10.  The font's size.  This parameter is only taken into account when using 'Native' canvas labels.  For DOM based labels the className node is added to the DOM element for styling via CSS.  You can also use Options.Controller methods to style individual labels."

	self optionAt: 'size' put: aNumber
]

{ #category : #options }
InfoVisLabelOptions >> style: aString [
	"Default: empty string.  Can be 'italic' or 'bold'.  This parameter is only taken into account when using 'Native' canvas labels.  For DOM based labels the className node is added to the DOM element for styling via CSS.  You can also use Options.Controller methods to style individual labels."

	self optionAt: 'style' put: aString
]

{ #category : #options }
InfoVisLabelOptions >> type: aString [
	"Default: HTML.  The type for the labels.  Can be 'HTML', 'SVG' or 'Native' canvas labels."

	self optionAt: 'type' put: aString
]
