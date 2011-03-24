Class {
	#name : #InfoVisExampleLibrary,
	#superclass : #WAFileLibrary,
	#category : #'InfoVis-Examples'
}

{ #category : #accessing }
InfoVisExampleLibrary >> layoutCss [

	^ '
div.content {
	clear: both;
	width: 1100px;
	margin: 15px;
}

div.navigation {
	position: relative;
	float: left;
	width: 200px; 
	padding: 5px;
	background-color: #FFFFFF;
}

div.example {
	position: relative;
	float: left;
	width: 800px; 
	padding: 5px;
	margin-left: 15px;
}


div.code {
	background-color: #EEEEEE;
	padding: 5px;
}

div.hidden {
	display: none;
}

'
]

{ #category : #accessing }
InfoVisExampleLibrary >> mainCss [

	^ '

body {
	font-family: Tahoma, Helvetica, sans-serif;
	font-size: 0.9em;
	color: #444444;
}

em {
	font-weight: normal;
	font-style: normal;
	color: #1BA6DF;
}

a {
	display: inline-block;
	color: #1BA6DF;
	text-decoration: none;
	border-bottom-style: dotted;
	border-bottom-width: 1px;
	border-bottom-color: #888888;
}

a:hover {
	border-bottom-style: solid;
	border-bottom-width: 1px;
	border-bottom-color: #1BA6DF;
}

'
]

{ #category : #accessing }
InfoVisExampleLibrary >> navigationCss [

	^ '
a.navigation {
	color: black;
	text-decoration: none;
	display: block;
}

a.selection {
	color: #1BA6DF;
	font-weight: bold;
	text-decoration: none;
	display: block;
}

ul.navigation {
	list-style-type: none;
	padding: 0px;
}

li.navigation {
	padding-left: 10px;
	margin: 5px;
	height: 1.5em;
	font-size: 1.1em;
}


'
]

{ #category : #accessing }
InfoVisExampleLibrary >> selectorsToInclude [

	^ #( #layoutCss #mainCss #navigationCss #visCss )
]

{ #category : #accessing }
InfoVisExampleLibrary >> visCss [

	^ '

div.InfoVis {
	background-color: black;
	width: 790px;
	height: 500px;
	overflow: hidden;
}

div.InfoVisBright {
	background-color: #E0F0FF;
	width: 790px;
	height: 500px;
	overflow: hidden;
}

div.tip {
	display: block;
	font-size: 0.7em;
	max-width: 300px;
	max-height: 200px;
	overflow: hidden;
	background-color: white;
	opacity: 0.7;
	padding: 5px;
	border-style: solid;
	border-width: 1px;
	border-color: black;
	-moz-box-shadow:2px 2px 8px #555555;
}

div.legend-color {
	border: 1px solid #AAAAAA;
	margin: 3px 3px 0 0;
	padding: 0 0 0 0;
	width: 1em;
	height: 1em;
	float: left;
}

div.legend-label {
	margin-top: 3px;
}

li.legend {
	padding: 3px;
}

ul.legend {
	border: 1px solid #555555;
	list-style-type: none;
	padding: 5px;
	margin: 0px;
	width: 10em;
}
'
]
