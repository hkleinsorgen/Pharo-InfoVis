Class {
	#name : #InfoVisIcicleComponent,
	#superclass : #InfoVisSpaceFillingComponent,
	#category : #''
}

{ #category : #JSON }
InfoVisIcicleComponent >> addSize: classSize toData: data [ 

	| size |
	size := ((classSize + 1) log: 2).
	data at: '$dim' put: size.
	data at: '$area' put: size.
]

{ #category : #rendering }
InfoVisIcicleComponent >> createVisualizationFor: html [ 

	| icicle |
	icicle := html infoVis icicle.
	icicle 
		animate: true;
		offset: 1;
		constrained: true;
		levelsToShow: 3;
		duration: 300;
		beHorizontal;
		displayCushions.
	icicle nodeOptions overridable: true.
	icicle nodeStyleOptions hoverColor: Color orange.
	icicle eventOptions 
		onClick: icicle enter asFunction;
		onRightClick: icicle out asFunction .
	self setDefaultOptions: icicle.
	^ icicle
]

{ #category : #JSON }
InfoVisIcicleComponent >> depth [

	" arbitrary limit "
	^ 10
]

{ #category : #rendering }
InfoVisIcicleComponent >> renderExplanationOn: html [

	html 
		text:'A space filling visualization. The width is fixed, the height visualizes the number of subclasses. Left click to dive, right click to navigate to the parent'.
]

{ #category : #rendering }
InfoVisIcicleComponent >> renderVisualization: icicle on: html [ 

	html div class: self visualizationCssClass;
		script: icicle.
	" load data "
	html document addLoadScript: 
		( html jQuery getJson infoVisJson: [ self jsonForClass: self rootClass ];
			onSuccess: icicle loadJson , icicle refresh ).
]

{ #category : #accessing }
InfoVisIcicleComponent >> title [

	^  'Icicle'
]
