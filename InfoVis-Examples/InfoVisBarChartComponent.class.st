Class {
	#name : #InfoVisBarChartComponent,
	#superclass : #InfoVisChartComponent,
	#category : 'InfoVis-Examples'
}

{ #category : #JSON }
InfoVisBarChartComponent >> jsonData [

	| data values classes |
	values := OrderedCollection new.
	classes := OrderedCollection new.
	classes add: Collection; add: WAComponent; add: JSObject; add: WAFileLibrary.
	classes do: [ : class | | classData |
		classData := OrderedCollection new.
		classData
			add: class subclasses size;
			add: class allSubclasses size.
		values add: (Dictionary new
			at: 'label' put: class name;
			at: 'values' put: classData;
			yourself)
	].
	data := Dictionary new.
	data at: 'label' put: #('Direct subclasses' 'All subclasses').
	data at: 'values' put: values.
	^ data
]

{ #category : #JSON }
InfoVisBarChartComponent >> jsonDataUrlFor: canvas [

	^ self jsonUrlFor: [ self jsonData asJson ] canvas: canvas
]

{ #category : #rendering }
InfoVisBarChartComponent >> renderExampleOn: html [ 

	| chart |
	chart := html infoVis barChart.
	chart
		animate: true;
		labelOffset: 10;
		beVertical;
		barsOffset: 20;
		showAggregates: false;
		showLabels: true;
		displayGroupedWithGradients.
	self setDefaultOptions: chart.
	html div class: 'InfoVis';
		script: chart.
	self renderLegendFor: chart on: html.
	html document addLoadScript: 
		( html jQuery getJson 
			url: (self jsonDataUrlFor: html);
			onComplete: chart loadJson ,(self legendScriptFor: chart)).
]

{ #category : #rendering }
InfoVisBarChartComponent >> renderExplanationOn: html [

	html render: 'A bar chart feeded by dynamic JSON data fetched with an  Ajax request'.
]

{ #category : #rendering }
InfoVisBarChartComponent >> renderLegendFor: visualization on: html [

	html paragraph: [ 
		html  unorderedList
			id: 'legend';
			class: 'legend'.
	].
]

{ #category : #accessing }
InfoVisBarChartComponent >> title [

	^  'Bar chart'
]