Class {
	#name : #ConfigurationOfInfoVis,
	#superclass : #Object,
	#instVars : [
		'project'
	],
	#classVars : [
		'LastVersionLoad'
	],
	#category : #ConfigurationOfInfoVis
}

{ #category : #private }
ConfigurationOfInfoVis class >> bootstrapPackage: aString from: aPath [ 
	| repository version |
	repository := MCHttpRepository
				location: aPath
				user: ''
				password: ''.
	repository
		versionReaderForFileNamed: aString , '.mcz'
		do: [:reader | 
			version := reader version.
			version load.
			version workingCopy repositoryGroup addRepository: repository]
]

{ #category : #private }
ConfigurationOfInfoVis class >> ensureMetacello [
	"Bootstrap Gofer (if necessary), load latest mcz file for ConfigurationOfMetacello (using old 
	 Gofer API), then load the latest version of Metacello itself."

	Smalltalk at: #MetacelloProject ifAbsent: [ | error |
		"list of repositories to try, in case primary repository is not accessible"
		(Array 
			with: 'http://www.squeaksource.com/MetacelloRepository' 
			with: 'http://seaside.gemstone.com/ss/metacello') do: [:repositoryUrl |
				([
					Smalltalk at: #Gofer ifAbsent: [
					"Current version of Gofer from which to bootstrap - as of 1.0-beta.21"
						self bootstrapPackage: 'Gofer-Core-lr.115' from: repositoryUrl ].
					Smalltalk at: #Gofer ifPresent: [:goferClass | | gofer |
						gofer := goferClass new
							url: repositoryUrl;
							yourself.
						[ gofer addPackage: 'ConfigurationOfMetacello' ] on: Warning do: [:ex | ex resume ].
						gofer load ]]
							on: Error
							do: [ :ex |
								error := ex.
								Transcript 
									cr; 
									show: 'failed ensureMetacello: ';
									show: ex description printString;
									show: '...retrying'.
								"try again"
								ex return: nil ]) ~~ nil
					ifTrue: [
						"load 'default' group of Metacello"
						(Smalltalk at: #ConfigurationOfMetacello) perform: #load.
						^self ]].
		"shouldn't get here unless the load failed ... throw an error"
		self error: 'retry with alternate repository failed: ', error description printString ]
]

{ #category : #'metacello tool support' }
ConfigurationOfInfoVis class >> isMetacelloConfig [
	"Answer true and the Metacello tools will operate on you"
	
	^true
]

{ #category : #'metacello tool support' }
ConfigurationOfInfoVis class >> lastMetacelloVersionLoad [
	"Answer the last version loaded and the list of packages loaded for that version."

	LastVersionLoad == nil ifTrue: [ LastVersionLoad := nil -> 'default' ].
	^LastVersionLoad
]

{ #category : #loading }
ConfigurationOfInfoVis class >> load [
	"self load"

	^self project latestVersion load
]

{ #category : #'metacello tool support' }
ConfigurationOfInfoVis class >> metacelloVersion: versionString loads: anArrayOrString [
	"Stash the last version loaded and the list of packages loaded for that version. The list
	 of packages will be used by the tools when doing 'Load Package Version'"

	LastVersionLoad := versionString -> anArrayOrString
]

{ #category : #accessing }
ConfigurationOfInfoVis class >> project [

	^self new project
]

{ #category : #'unloading Metacello' }
ConfigurationOfInfoVis class >> unloadMetacello [

	Smalltalk at: #ConfigurationOfMetacello ifPresent: [:cls | cls unloadMetacello ]
]

{ #category : #baselines }
ConfigurationOfInfoVis >> baseline100: spec [ 
	<version: '1.0-baseline'>
	
	spec for: #common do: [
		spec blessing: #baseline.
		spec repository: 'http://www.squeaksource.com/InfoVis'.	
		spec 
			package: 'InfoVis-Core';
			package: 'InfoVis-Tests' with: [ spec requires: 'InfoVis-Core'];
			package: 'InfoVis-jQuery' with: [ spec requires: #('InfoVis-Core')];
			package: 'InfoVis-Examples' with: [ spec requires: #('InfoVis-Core' 'InfoVis-jQuery')].
		spec
			group: 'default' with: #('Core' 'Examples');
			group: 'Core' with: #(
				'InfoVis-Core'
				);
			group: 'Examples' with: #(
				'InfoVis-Examples' 
			);
			group: 'Tests' with: #('InfoVis-Tests'). 
		]

]

{ #category : #accessing }
ConfigurationOfInfoVis >> project [

	^ project ifNil: [ | constructor |
		"Bootstrap Metacello if it is not already loaded"
		self class ensureMetacello.
		"Construct Metacello project"
		constructor := (Smalltalk at: #MetacelloVersionConstructor) on: self.
		project := constructor project.
		project loadType: #linear. "change to #atomic if desired"
		project ]
]

{ #category : #versions }
ConfigurationOfInfoVis >> version100: spec [
	<version: '1.0' imports: #('1.0-baseline' )>

	spec for: #common do: [
		spec blessing: #release.
		spec description: 'initial release'.
		spec author: 'hkl'.
		spec timestamp: '18/09/2010 21:30'.
		
		spec 
			package: 'InfoVis-Core'with: 'InfoVis-Core-hkl.10';
			package: 'InfoVis-jQuery'with: 'InfoVis-jQuery-hkl.1';
			package: 'InfoVis-Tests'with: 'InfoVis-Tests-hkl.4';
			package: 'InfoVis-Examples'with: 'InfoVis-Examples-hkl.8'.
	].

]

{ #category : #versions }
ConfigurationOfInfoVis >> version110: spec [
	<version: '1.1' imports: #('1.0-baseline' )>

	spec for: #common do: [
		spec blessing: #release.
		spec description: 'release with InfoVis 2.0.1'.
		spec author: 'hkl'.
		spec timestamp: '06/25/2011 15:12'.
		
		spec 
			package: 'InfoVis-Core'with: 'InfoVis-Core-hkl.11';
			package: 'InfoVis-jQuery'with: 'InfoVis-jQuery-hkl.1';
			package: 'InfoVis-Tests'with: 'InfoVis-Tests-hkl.4';
			package: 'InfoVis-Examples'with: 'InfoVis-Examples-hkl.10'.
	].

]
