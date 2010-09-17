Class {
	#name : #InfoVisSunBurstComponent,
	#superclass : #InfoVisSpaceFillingComponent,
	#category : 'InfoVis-Examples'
}

{ #category : #JSON }
InfoVisSunBurstComponent >> addSize: data toData: classSize [ 

	data at: '$angularWidth' put: classSize.
]

{ #category : #JSON }
InfoVisSunBurstComponent >> depth [

	^ 2
]

{ #category : #options }
InfoVisSunBurstComponent >> labelSize [

	^ 10
]

{ #category : #accessing }
InfoVisSunBurstComponent >> renderExampleOn: html [ 

	| sunBurst |
	sunBurst := html infoVis sunBurst.
	sunBurst 
		levelDistance: 100;
		displayMultipieWithGradients.
	sunBurst nodeOptions overridable: true.
	sunBurst nodeStyleOptions
		hoverColor: Color orange;
		clickColor: Color red.
	sunBurst eventOptions 
		onClick: ( 
			sunBurst 
				rotate: self firstArgument 
				duration: 1000 
				transition: InfoVisTransition quartetic easeInOut 
			) asFunction;
		onRightClick: ( 
			html jQuery getJson 
				infoVisJson: [ : className | self jsonForLink: className ]
					value: (JSStream on: 'arguments[0].data.link');
				onComplete: sunBurst loadJson, sunBurst refresh).
	self setDefaultOptions: sunBurst.
	html div class: self visualizationCssClass;
		script: sunBurst.
	" load data "
	html document addLoadScript: (html jQuery getJson 
				infoVisJson: [  self jsonForClass: Collection ];
				onComplete: sunBurst loadJson, sunBurst refresh).
]

{ #category : #rendering }
InfoVisSunBurstComponent >> renderExplanationOn: html [

	html 
		text:'A radial space filling tree visualization. The size represents the number of subclasses. ';
		emphasis: 'Left click'; text: ' on a class pie to rotate the sunburst, ';
		emphasis: 'right click'; text: ' to dive'.
]

{ #category : #accessing }
InfoVisSunBurstComponent >> title [

	^  'Sunburst'
]
