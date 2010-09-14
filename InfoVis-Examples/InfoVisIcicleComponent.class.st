Class {
	#name : #InfoVisIcicleComponent,
	#superclass : #InfoVisSpaceFillingComponent,
	#category : 'InfoVis-Examples'
}

{ #category : #JSON }
InfoVisIcicleComponent >> addSize: data toData: classSize [ 

	| size |
	size := ((classSize + 1) log: 2).
	data at: '$dim' put: size.
	data at: '$area' put: size.
]

{ #category : #JSON }
InfoVisIcicleComponent >> depth [

	" arbitrary limit "
	^ 10
]

{ #category : #rendering }
InfoVisIcicleComponent >> renderExampleOn: html [ 

	| icicle |
	icicle := html infoVis icicle.
	icicle 
		animate: true;
		offset: 1;
		constrained: true;
		levelsToShow: 3;
		duration: 300;
		beHorizontal.
	icicle nodeOptions overridable: true.
	icicle nodeStylesOptions hoverColor: ColorValue orange.
	icicle eventOptions 
		onClick: icicle enter asFunction;
		onRightClick: icicle out asFunction .
	self setDefaultOptions: icicle.
	html div class: self visualizationCssClass;
		script: icicle.
	" load initial data "
	html document addLoadScript: ( html jQuery getJson infoVisJson: [ self jsonForClass: Collection ];
				onComplete: icicle loadJson , icicle refresh ).
]

{ #category : #rendering }
InfoVisIcicleComponent >> renderExplanationOn: html [

	html 
		text:'A space filling visualization. The width is fixed, the height visualizes the number of subclasses. Different colors represent different types of classes (indexed, instVars). ';
		emphasis: 'Left click'; text: ' to dive, ';
		emphasis: 'right click'; text: ' to navigate to the parent'.
]

{ #category : #accessing }
InfoVisIcicleComponent >> title [

	^  'Icicle'
]
