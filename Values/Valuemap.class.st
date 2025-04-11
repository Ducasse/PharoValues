"
A Valuemap is an ordered dictionary preserving the order in which entries are added.
Instances are also used as ordered volatile dictionary, not just as value.

"
Class {
	#name : 'Valuemap',
	#superclass : 'OrderedDictionary',
	#category : 'Values-Core',
	#package : 'Values',
	#tag : 'Core'
}

{ #category : 'examples' }
Valuemap class >> example [
	<sampleInstance>
	"self example"

	| valauemap |
	valauemap := Valuemap new.
	valauemap at: #isinTitle put: 'ISIN'.
	valauemap at: #isinValue put: 'DE0009999991'.
	valauemap at: #börsenwertTitle put: 'Börsenwert'.
	valauemap at: #börsenwertValue put: '99,9 Mrd. €'.
	valauemap at: #hochTiefTitle put: 'Hoch/Tief'.
	valauemap at: #hochTiefValue put: '10,00/20,00'.
	valauemap at: #kgvTitle put: 'KGV'.
	valauemap at: #kgvValue put: '9,87'.
	^valauemap
]

{ #category : 'comparing' }
Valuemap >> = otherOrderedDictionary [
	^self class == otherOrderedDictionary class and: [
	self size = otherOrderedDictionary size and: [
	(1 to: self size) allSatisfy: [:i |
		(self atIndex: i) = (otherOrderedDictionary atIndex: i)]]]
]

{ #category : 'printing' }
Valuemap >> atIndex: index [
	"Returns an Association"
	self flag: #todo. 
	"the name of the method is misleading. A good one is associationAtIndex:"
	
	^self associationAt: (self keyAtIndex: index)
]

{ #category : 'copying' }
Valuemap >> copyWithAll: aDictionary [
	"Answer a copy of the receiver with all associations from aDictionary added"

	| copy |
	copy := self copy.
	copy addAll: aDictionary.
	^copy
]

{ #category : 'printing' }
Valuemap >> first [
	"<Association>"

	^self associationAt: self keys first
]

{ #category : 'comparing' }
Valuemap >> hash [
	^(1 to: self size) inject: self class hash into: [:hash :index |
		| assoc |
		assoc := self atIndex: index.
		hash bitXor: (assoc key hash bitXor: assoc value hash)]
]

{ #category : 'accessing' }
Valuemap >> indexOf: aKey [

	^self keys indexOf: aKey
]

{ #category : 'printing' }
Valuemap >> keysForPrinting [
	^self keys
]

{ #category : 'printing' }
Valuemap >> printValueWith: printer [
	^DictionaryPrintvalue arguments: (self printargumentsWith: printer) isOrdered: true
]

{ #category : 'printing' }
Valuemap >> printargumentsWith: printer [
	| args |
	args := OrderedCollection new.
	self keysForPrinting do: [:key |
		args add: (DictionaryPrintargument
			name: (key printValueWith: printer)
			value: ((self at: key) printValueWith: printer))].
	^args
]
