"
ValuePrinter creates the source for a Value.
For each level, a new ValuePrinter is created.

Instance Variables:
	target	<Value class>	defines the scoping for the created source - how class names are printed
	level	<Integer>		the indent level
	stream	<WriteStream>	a writestream passed around to collect the sources


"
Class {
	#name : 'ValuePrinter',
	#superclass : 'Object',
	#instVars : [
		'target'
	],
	#category : 'Values',
	#package : 'Values'
}

{ #category : 'instance creation' }
ValuePrinter class >> newFor: targetClass [
	| inst |
	inst := self new.
	inst initializeTarget: targetClass.
	^inst
]

{ #category : 'accessing' }
ValuePrinter >> array: selectorname value: object [
	"<Printargument | nil>"

	object isEmpty ifTrue: [
		^nil].
	^Printargument name: selectorname value: (object printValueWith: self)
]

{ #category : 'accessing' }
ValuePrinter >> classnameOf: value [
	^value class nameRelativeTo: self target
]

{ #category : 'accessing' }
ValuePrinter >> constant: selectorname value: object [
	"<Printargument>"

	^Printargument name: selectorname value: (object printValueWith: self)
]

{ #category : 'accessing' }
ValuePrinter >> dictionary: selectorname value: object [
	"<Printargument | nil>"

	object isEmpty ifTrue: [
		^nil].
	^Printargument name: selectorname value: (object printValueWith: self)
]

{ #category : 'initialize-release' }
ValuePrinter >> initializeTarget: targetClass [
	target := targetClass
]

{ #category : 'accessing' }
ValuePrinter >> optional: selectorname value: object [
	"<Printargument | nil>"

	^object ifNotNil: [
		Printargument name: selectorname value: (object printValueWith: self)]
]

{ #category : 'accessing' }
ValuePrinter >> printvalue: aValue arguments: arguments [
	aValue class new = aValue ifTrue: [
		^ValuePrintvalue classname: (self classnameOf: aValue)].
	^ValuePrintvalue
		classname: (self classnameOf: aValue)
		arguments: (arguments select: [:arg |
			arg notNil])
]

{ #category : 'accessing' }
ValuePrinter >> target [
	"<Value class>
	the class for which the object is printed.
	Takes the visibility of classes into account for short class name generation"

	^target
]
