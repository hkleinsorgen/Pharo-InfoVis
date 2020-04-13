Class {
	#name : #InfoVisSpaceTreeComponent,
	#superclass : #InfoVisGraphComponent,
	#category : 'InfoVis-Examples'
}

{ #category : #rendering }
InfoVisSpaceTreeComponent >> createVisualizationFor: html [ 

	| spaceTree |
	spaceTree := html infoVis spaceTree.
	spaceTree 
		levelDistance: 50.
	spaceTree 
		duration: 500;
		transition: InfoVisTransition quartetic easeInOut.
	spaceTree navigationOptions
		panning: true.
	spaceTree nodeOptions
		width: 160;
		height: 20;
		rectangle;
		overridable: true.
	spaceTree edgeOptions
		displayAsBezier;
		overridable: true.
	spaceTree onCreateLabel: 
		((self labelFunctionFor: spaceTree) asFunction: #(label node)).
	self setDefaultOptions: spaceTree.
	^ spaceTree
]

{ #category : #JSON }
InfoVisSpaceTreeComponent >> jsonData [

	^ self jsonForClass: self rootClass
]

{ #category : #rendering }
InfoVisSpaceTreeComponent >> labelFunctionFor: spaceTree [

	^ JSStream on: '
            label.id = node.id;            
            label.innerHTML = node.name;
            label.onclick = function(){
			', spaceTree variableNameNeeded, '.onClick(node.id);
            };
            //set label styles
            var style = label.style;
            style.width = "160px";
            style.height = "20px";
            style.cursor = "pointer";
            style.color = "#FFF";
            style.fontSize = "0.8em";
            style.textAlign= "center";
            style.paddingTop = "3px";
'
]

{ #category : #rendering }
InfoVisSpaceTreeComponent >> renderExplanationOn: html [ 

	html 
		render: 'Color saturation represents the number of subclasses. Click on a node to navigate. Pan by dragging the background. '.
]

{ #category : #rendering }
InfoVisSpaceTreeComponent >> renderVisualization: tree on: html [ 

	html div class: self visualizationCssClass;
		script: tree.
	" load data "
	html document addLoadScript: ( html jQuery getJson infoVisJson: [ self jsonData ];
		onComplete: 
			tree loadJson , 
			tree compute , 
			(tree onClick: (self idForPassenger: SequenceableCollection ))).
]

{ #category : #options }
InfoVisSpaceTreeComponent >> setDefaultLabelOptions: aVisualisation [
	" uses a custom label function "
]

{ #category : #accessing }
InfoVisSpaceTreeComponent >> title [

	^ 'Space tree'
]
