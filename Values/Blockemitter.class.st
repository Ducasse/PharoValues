"
Emits source as indented block
"
Class {
	#name : 'Blockemitter',
	#superclass : 'SourceEmitter',
	#category : 'Values',
	#package : 'Values'
}

{ #category : 'writing' }
Blockemitter >> emitSeparator [
	self stream cr.
	self level + 1 timesRepeat: [self stream tab]
]

{ #category : 'initialize-release' }
Blockemitter >> initializePrinter: aPrinter stream: aWriteStream level: anInteger [
	printer := aPrinter.
	stream := aWriteStream.
	level := anInteger + 1
]
