Class {
	#name : #InfoVisChartComponent,
	#superclass : #InfoVisExampleComponent,
	#category : 'InfoVis-Examples'
}

{ #category : '*InfoVis-Examples' }
InfoVisChartComponent class >> isAbstract [

	^ self = InfoVisChartComponent
]

{ #category : #rendering }
InfoVisChartComponent >> legendScriptFor: visualization [

	| script |
	script := JSStream new.
	script nextPutAll: '
		var list = $jit.id(''legend'');
		var legend = '; nextPutAll: visualization variableName; nextPutAll: '.getLegend();
		var listItems = [];
   		 for(var name in legend) {
     			 listItems.push(''<div class=\"legend-color\" style=\"background-color:'' + legend[name] + ''\">&nbsp;</div>'' + name);
		}
		list.innerHTML = ''<li class="legend">'' + listItems.join(''</li><li class="legend">'') + ''</li>'';'.
	^ script
]
