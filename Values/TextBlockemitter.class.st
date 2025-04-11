"
TextBlockEmitter emits text as indented block
"
Class {
	#name : 'TextBlockemitter',
	#superclass : 'TextEmitter',
	#category : 'Values',
	#package : 'Values'
}

{ #category : 'writing' }
TextBlockemitter >> emitSeparator [
	self stream cr.
	self level + 1 timesRepeat: [self stream tab]
]

{ #category : 'writing' }
TextBlockemitter >> inBracketsDo: aZeroArgumentBlock [
	aZeroArgumentBlock value
]

{ #category : 'initialize-release' }
TextBlockemitter >> initializePrinter: aPrinter stream: aWriteStream level: anInteger [
	printer := aPrinter.
	stream := aWriteStream.
	level := anInteger + 1
]
