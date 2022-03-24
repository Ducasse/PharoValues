Class {
	#name : #BaselineOfValues,
	#superclass : #BaselineOf,
	#category : #BaselineOfValues
}

{ #category : #baselines }
BaselineOfValues >> baseline: spec [
	<baseline>
	
	spec for: #common do: [
		spec package: 'Values'.
		spec
			package: 'Values-Tests'
			with: [ spec requires: #( 'Values' ) ]. 
			
		spec
				group: 'Core' with: #('Values' );
				group: 'Tests' with: #('Values-Tests').]
]
