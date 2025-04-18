"
Value is the abstract root object of values (literal objects).
All Value classes which have subclasses are considered abstract. Only leaf classes can have instances!
Literal objects are created immutable with constructors.
The instance variables are object constants.

Subclasses must implement the following messages:
	class specification
		localSpecification
"
Class {
	#name : 'Value',
	#superclass : 'Object',
	#classVars : [
		'NamedValuesRegistry'
	],
	#category : 'Values-Core',
	#package : 'Values',
	#tag : 'Core'
}

{ #category : 'named values' }
Value class >> namedValuesAt: aClass [
	"<Dictionary key: Value value: Symbol>
	the named instances of aClass"

	^self namedValuesRegistry at: aClass ifAbsent: [Dictionary new]
]

{ #category : 'named values' }
Value class >> namedValuesAt: aClass ifAbsentPut: aBlock [
	"<Dictionary key: Value value: Symbol>
	the named instances of aClass"

	^self namedValuesRegistry at: aClass ifAbsentPut: aBlock
]

{ #category : 'named values' }
Value class >> namedValuesRegistry [
	"<Dictionary key: Class value: (Dictionary key: Value value: Symbol)>
	the named instances of classes.
	This is a light weight implementation to hold all named instances of all classes, instead of storing them with the class"
	
	^NamedValuesRegistry ifNil: [NamedValuesRegistry := Dictionary new]
]

{ #category : 'class initialization' }
Value class >> obsolete [
	self allInstancesDo: #beMutable.
	super obsolete
]

{ #category : 'initialize-release' }
Value class >> primeRuntime [
	"reset and load all class variables to fill the caches to avoid lazy initialization at runtime.
	This should be executed when deploying after all application fonts and extensions are loaded"
	"self primeRuntime"

	self resetNamedValuesRegistry.
	Object namesByValues
]

{ #category : 'initialize-release' }
Value class >> resetNamedValuesRegistry [
	"self resetNamedValuesRegistry"

	NamedValuesRegistry := nil
]

{ #category : 'pragmas' }
Value class >> specificationPragmas [
	<pragmas: #class>
	^#(
		#constant:class:
		#constant:class:comment:
		
		#optional:class:default:
		#optional:class:default:comment:
		
		#sequence:
		#sequence:comment:
		
		#map:
		#map:comment:
	)
]

{ #category : 'comparing' }
Value >> = anObject [
	"all instvars must be equal"

	^self isEqualValue: anObject
]

{ #category : 'comparing' }
Value >> hash [
	^(1 to: self class instSize) inject: 0 into: [:hash :i | hash bitXor: (self instVarAt: i) hash]
]

{ #category : 'testing' }
Value >> isEmpty [
	^self = self class new
]

{ #category : 'comparing' }
Value >> isEqualValue: anObject [
	self == anObject ifTrue: [
		^true].
	self class = anObject class ifFalse: [
		^false].
	1 to: self class instSize do: [:i |
		((self instVarAt: i) isEqualValue: (anObject instVarAt: i)) ifFalse: [
			^false]].
	^true
]

{ #category : 'testing' }
Value >> notEmpty [
	^self isEmpty not
]

{ #category : 'marshaling' }
Value >> passMode [
	"for OpenTalk StSt (Smalltalk to Smalltalk)"

	^#value
]

{ #category : 'copying' }
Value >> postCopy [
	super postCopy.
	self beImmutable
]

{ #category : 'printing' }
Value >> printOn: stream [
	stream nextPutAll: self asSource
]

{ #category : 'printing' }
Value >> printValueWith: printer [
	^printer printvalue: self arguments: #()
]
