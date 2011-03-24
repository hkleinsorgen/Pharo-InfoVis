Class {
	#name : #InfoVisBarChartComponent,
	#superclass : #InfoVisChartComponent,
	#category : #'InfoVis-Examples'
}

{ #category : #rendering }
InfoVisBarChartComponent >> createVisualizationFor: html [ 

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
	^ chart
]

{ #category : #JSON }
InfoVisBarChartComponent >> jsonData [

	| data values classes |
	values := OrderedCollection new.
	classes := OrderedCollection new.
	classes
		add: Collection;
		add: WAComponent;
		add: JSObject;
		add: WAFileLibrary.
	classes do: 
		[: class | | classData |
			classData := OrderedCollection new.
			classData 
				add: class subclasses size;
				add: class allSubclasses size;
				add: class selectors size + class class selectors size.
			values add: ( Dictionary new 
						at: 'label' put: class name;
						at: 'values' put: classData;
						yourself )
		].
	data := Dictionary new.
	data at: 'label' put: self labels.
	data at: 'values' put: values.
	^ data
]

{ #category : #accessing }
InfoVisBarChartComponent >> labels [

	^ #( 'Direct subclasses' 'All subclasses' 'Methods')
]

{ #category : #rendering }
InfoVisBarChartComponent >> renderExplanationOn: html [

	html render: 'A bar chart feeded by JSON data fetched with an  Ajax request'.
]

{ #category : #rendering }
InfoVisBarChartComponent >> renderVisualization: chart on: html [ 

	html div class: self visualizationCssClass;
		script: chart.
	self renderLegendOn: html.
	" load data "
	html document addLoadScript: 
		( html jQuery getJson infoVisJson: [ self jsonData ];
			onComplete: chart loadJson,
				 ( self legendScriptFor: chart )).
]

{ #category : #accessing }
InfoVisBarChartComponent >> title [

	^  'Bar chart'
]
