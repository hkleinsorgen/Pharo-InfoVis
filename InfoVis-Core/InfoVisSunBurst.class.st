"
A radial space filling tree visualization.
"
Class {
	#name : #InfoVisSunBurst,
	#superclass : #InfoVisVisualization,
	#category : 'InfoVis-Core'
}

{ #category : #accessing }
InfoVisSunBurst class >> infoVisName [

	^ 'Sunburst'
]

{ #category : #testing }
InfoVisSunBurst >> canRefresh [

	^ true
]

{ #category : #'options - convenience' }
InfoVisSunBurst >> displayMultipie [

	self nodeOptions type: 'multipie'
]

{ #category : #'options - convenience' }
InfoVisSunBurst >> displayMultipieWithGradients [

	self nodeOptions type: 'gradient-multipie'
]

{ #category : #options }
InfoVisSunBurst >> edgeType: anObject [
	"Described in Options.Edge.  Default: none."

	self optionAt: 'Edge.type' put: anObject
]

{ #category : #options }
InfoVisSunBurst >> interpolation: aString [
	"Default: linear.  Describes the way nodes are interpolated.  Possible values are 'linear' and 'polar'."

	self optionAt: 'interpolation' put: aString
]

{ #category : #options }
InfoVisSunBurst >> labelTextAlign: anObject [
	"Described in Options.Label.  Default: start."

	self optionAt: 'Label.textAlign' put: anObject
]

{ #category : #options }
InfoVisSunBurst >> labelTextBaseline: anObject [
	"Described in Options.Label.  Default: middle."

	self optionAt: 'Label.textBaseline' put: anObject
]

{ #category : #options }
InfoVisSunBurst >> levelDistance: aNumber [
	"Default: 100.  The distance between levels of the tree."

	self optionAt: 'levelDistance' put: aNumber
]

{ #category : #'options - convenience' }
InfoVisSunBurst >> linearInterpolation [

	self interpolation: 'linear'
]

{ #category : #options }
InfoVisSunBurst >> nodeHeight: anObject [
	"Described in Options.Node.  Default: 0."

	self optionAt: 'Node.height' put: anObject
]

{ #category : #options }
InfoVisSunBurst >> nodeType: anObject [
	"Described in Options.Node.  Default: to multipie."

	self optionAt: 'Node.type' put: anObject
]

{ #category : #'options - convenience' }
InfoVisSunBurst >> polarInterpolation [

	self interpolation: 'polar'
]

{ #category : #'functions - convenience' }
InfoVisSunBurst >> rotate: node duration: duration transition: transition [ 

	^ self 
		rotate: node
		method: 'animate'
		options: ( Dictionary new at: 'duration' put: duration;
				at: 'transition' put: transition;
				yourself ).
]

{ #category : #functions }
InfoVisSunBurst >> rotate: node method: method options: rotateOptions [ 
	" Rotates the graph so that the selected node is horizontal on the right."

	^ self variableAccess call: 'rotate' with: node with: method with: rotateOptions.
]

{ #category : #functions }
InfoVisSunBurst >> rotateAngle: theta method: method options: rotateOptions [ 
	" Rotates the graph of an angle theta."

	^ self variableAccess call: 'rotateAngle' with: theta with: method with: rotateOptions.
]
