"
Emits source as one line
"
Class {
	#name : 'Lineemitter',
	#superclass : 'SourceEmitter',
	#category : 'Values',
	#package : 'Values'
}

{ #category : 'writing' }
Lineemitter >> emitSeparator [
	self stream space
]
