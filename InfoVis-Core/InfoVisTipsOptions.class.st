"
Tips options
"
Class {
	#name : #InfoVisTipsOptions,
	#superclass : #InfoVisOptions,
	#category : 'InfoVis-Core'
}

{ #category : '*InfoVis-Core' }
InfoVisTipsOptions class >> infoVisName [

	^ 'Tips'
]

{ #category : #options }
InfoVisTipsOptions >> enable: aBoolean [
	"Default: false.  If true, a tooltip will be shown when a node is hovered.  The tooltip is a div DOM element having 'tip' as CSS class."

	self optionAt: 'enable' put: aBoolean
]

{ #category : #options }
InfoVisTipsOptions >> offsetX: aNumber [
	"Default: 20.  An offset added to the current tooltip x-position (which is the same as the current mouse position).  Default: 20."

	self optionAt: 'offsetX' put: aNumber
]

{ #category : #options }
InfoVisTipsOptions >> offsetY: aNumber [
	"Default: 20.  An offset added to the current tooltip y-position (which is the same as the current mouse position).  Default: 20."

	self optionAt: 'offsetY' put: aNumber
]

{ #category : #options }
InfoVisTipsOptions >> onHide: aFunction [
	"function arguments: "
	"This callack is used when hiding a tooltip."

	self optionAt: 'onHide' put: aFunction asFunction
]

{ #category : #options }
InfoVisTipsOptions >> onShow: aFunction [
	"function arguments: tip, node"
	"This callack is used right before displaying a tooltip.  The first formal parameter is the tip itself (which is a DivElement).  The second parameter may be a Graph.Node for graph based visualizations or an object with label, value properties for charts."

	self optionAt: 'onShow' put: aFunction asFunction
]

{ #category : #'options - convenience' }
InfoVisTipsOptions >> renderAsHtml [

	self type: 'HTML'
]

{ #category : #'options - convenience' }
InfoVisTipsOptions >> renderAsSvg [

	self type: 'SVG'
]

{ #category : #'options - convenience' }
InfoVisTipsOptions >> renderLikeLabels [

	self type: 'auto'
]

{ #category : #'options - convenience' }
InfoVisTipsOptions >> renderNative [

	self type: 'Native'
]

{ #category : #options }
InfoVisTipsOptions >> type: aString [
	"Default: auto.  Defines where to attach the MouseEnter/Leave tooltip events.  Possible values are 'Native' to attach them to the canvas or 'HTML' to attach them to DOM label elements (if defined).  'auto' sets this property to the value of Options.Label's type property."

	self optionAt: 'type' put: aString
]
