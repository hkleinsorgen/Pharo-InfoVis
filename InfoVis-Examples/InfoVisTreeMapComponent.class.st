Class {
	#name : #InfoVisTreeMapComponent,
	#superclass : #InfoVisSpaceFillingComponent,
	#category : 'InfoVis-Examples'
}

{ #category : #rendering }
InfoVisTreeMapComponent >> createVisualizationFor: html [ 

	| treeMap |
	treeMap := html infoVis squarified.
	treeMap 
		animate: true;
		titleHeight: 12;
		offset: 1;
		displayCushions.
	treeMap nodeOptions overridable: true.
	treeMap eventOptions 
		onClick: treeMap enter asFunction;
		onRightClick: treeMap out asFunction .
	treeMap beHorizontal.
	self setDefaultOptions: treeMap.
	^ treeMap
]

{ #category : #JSON }
InfoVisTreeMapComponent >> depth [

	^ 3
]

{ #category : #JSON }
InfoVisTreeMapComponent >> itemForCategory: category classItems: classItems [ 

	| item data totalSize |
	totalSize := classItems inject: 0 into: [ : sum : each | sum + ((each at: 'data') at: '$area') ].
	item := Dictionary new.
	item at: 'name' put: category.
	item at: 'id' put: (self idForPassenger: category).
	item at: 'children' put: classItems.
	data := Dictionary new.
	data at: '$color' put: '#3995C6'.
	data at: '$area' put: totalSize.
	item at: 'data' put: data.
	^ item
]

{ #category : #JSON }
InfoVisTreeMapComponent >> itemForClass: aClass [ 

	| item data |
	item := Dictionary new.
	item at: 'name' put: aClass name.
	item at: 'id' put: (self idForPassenger: aClass).
	data := Dictionary new.
	data at: '$area' put:  aClass selectors size + aClass class selectors size.
	data at: '$color' put: '#38C49C'.
	data at: 'comment' put: (aClass comment ifNotNil: [ : c | c asString ] ifNil: [ '' ]).
	item at: 'data' put: data.
	^ item
]

{ #category : #JSON }
InfoVisTreeMapComponent >> jsonForClass: aClass [ 

	| root subclasses children data categorized |
	root := Dictionary new.
	root at: 'name' put: aClass name.
	root at: 'id' put: (self idForPassenger: aClass).
	data := Dictionary new.
	data at: '$color' put: '#5067A0'.
	root at: 'data' put: data.
	subclasses := aClass allSubclasses select: [: class | class selectors size > self selectorsLimit ].
	categorized := Dictionary new.
	subclasses do: [: subclass | ( categorized at: subclass category asString ifAbsentPut: [ Set new ]) add: ( self itemForClass: subclass )].
	children := OrderedCollection new: subclasses size.
	categorized keysAndValuesDo: [: category : items | children add: ( self itemForCategory: category classItems: items )].
	root at: 'children' put: children.
	^ root
]

{ #category : #rendering }
InfoVisTreeMapComponent >> renderControlsFor: treeMap on: html [ 
	" Controls that change the type of the TreeMap "
 
	| group |
	group := html radioGroup.
	group radioButton selected: true;
		onClick: ( treeMap extendWithSquarified, treeMap refresh );
		with: 'Squarified'.
	group radioButton 
		onClick: ( treeMap extendWithStrip, treeMap refresh );
		with: 'Strip'.
	group radioButton 
		onClick: ( treeMap extendWithSliceAndDice, treeMap refresh );
		with: 'Slice and dice'.
	html text: ' '.
]

{ #category : #rendering }
InfoVisTreeMapComponent >> renderExplanationOn: html [

	html 
		text: 'Visualizes the number of methods a class implements. Left click to dive, right click to navigate to the parent'.
]

{ #category : #rendering }
InfoVisTreeMapComponent >> renderVisualization: treeMap on: html [ 

	html div class: self visualizationCssClass;
		script: treeMap.
	" load data "
	html document addLoadScript: 
		( html jQuery getJson infoVisJson: [ self jsonForClass: self rootClass ];
			onComplete: treeMap loadJson , treeMap refresh ).
]

{ #category : #JSON }
InfoVisTreeMapComponent >> rootClass [

	^ WAComponent
]

{ #category : #JSON }
InfoVisTreeMapComponent >> selectorsLimit [

	^ 10
]

{ #category : #accessing }
InfoVisTreeMapComponent >> title [

	^  'TreeMap'
]

{ #category : #rendering }
InfoVisTreeMapComponent >> toolTipFunction [

	^ '
var tipHTML = "<b>" + node.name + "</b>";
if (node.data.$area != null)
	tipHTML += "<p/>" + node.data.$area + " selectors"
tip.innerHTML =  tipHTML' 
	asFunction: #( #tip #node )
]
