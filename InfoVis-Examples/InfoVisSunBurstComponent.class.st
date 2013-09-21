Class {
	#name : #InfoVisSunBurstComponent,
	#superclass : #InfoVisSpaceFillingComponent,
	#category : #'InfoVis-Examples'
}

{ #category : #JSON }
InfoVisSunBurstComponent >> addSize: classSize toData: data [ 

	data at: '$angularWidth' put: classSize.
]

{ #category : #rendering }
InfoVisSunBurstComponent >> clickTargetIDScriptFor: sunBurst [
	"when clicking on the root, we have to fetch the parent ID in an ungly way "

	| var |
	var := sunBurst variableNameNeeded.
	^ JSStream on: '(hovered == false ? ' , var , '.graph.nodes[' , var , '.root].data.parentId : hovered.id)'
]

{ #category : #rendering }
InfoVisSunBurstComponent >> createVisualizationFor: html [ 

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
		onClick: ((self rotateFunctionFor: sunBurst) asFunction: #(node));
		onRightClick: ((( 
			" update data "
			html jQuery getJson 
				infoVisJson: [ : id | self jsonForID: id ]
					value: (self clickTargetIDScriptFor: sunBurst);
				onSuccess: sunBurst loadJson, sunBurst refresh)) asFunction: #(hovered event)).
	self setDefaultOptions: sunBurst.
	^ sunBurst
]

{ #category : #JSON }
InfoVisSunBurstComponent >> depth [

	^ 2
]

{ #category : #options }
InfoVisSunBurstComponent >> labelSize [

	^ 10
]

{ #category : #rendering }
InfoVisSunBurstComponent >> renderExplanationOn: html [

	html 
		text: 'A radial space filling tree visualization. The size represents the number of subclasses. Left click on a class pie to rotate the sunburst. Right click to dive. Dive up by right-clicking on the center.'.
]

{ #category : #rendering }
InfoVisSunBurstComponent >> renderVisualization: sunBurst on: html [ 

	html div class: self visualizationCssClass;
		script: sunBurst.
	" load data "
	html document addLoadScript: (html jQuery getJson 
				infoVisJson: [ self jsonForClass: self rootClass ];
				onSuccess: sunBurst loadJson, sunBurst refresh).
]

{ #category : #rendering }
InfoVisSunBurstComponent >> rotateFunctionFor: sunBurst [

	| var |
	var := sunBurst variableNameNeeded.
	^ JSStream on: '
		 if (!node) return;
		', var, '.tips.hide();
		', var, '.rotate(node, "animate", {
			duration: 1000,  
			transition: $jit.Trans.Quart.easeInOut 		
		});'
]

{ #category : #accessing }
InfoVisSunBurstComponent >> title [

	^  'Sunburst'
]
