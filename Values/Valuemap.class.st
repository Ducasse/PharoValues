"
VisualWorks class
"
Class {
	#name : #Valuemap,
	#superclass : #OrderedDictionary,
	#category : #Values
}

{ #category : #comparing }
Valuemap >> = otherOrderedDictionary [
	^self class == otherOrderedDictionary class and: [
	self size = otherOrderedDictionary size and: [
	(1 to: self size) allSatisfy: [:i |
		(self atIndex: i) = (otherOrderedDictionary atIndex: i)]]]
]

{ #category : #copying }
Valuemap >> copyWithAll: aDictionary [
	"Answer a copy of the receiver with all associations from aDictionary added"

	| copy |
	copy := self copy.
	copy addAll: aDictionary.
	^copy
]

{ #category : #comparing }
Valuemap >> hash [
	^(1 to: self size) inject: self class hash into: [:hash :index |
		| assoc |
		assoc := self atIndex: index.
		hash bitXor: (assoc key hash bitXor: assoc value hash)]
]

{ #category : #accessing }
Valuemap >> indexOf: aKey [
	"<Integer>"

	^self keys indexOf: aKey
]

{ #category : #printing }
Valuemap >> keysForPrinting [
	^self keys
]

{ #category : #printing }
Valuemap >> printValueWith: printer [
	^DictionaryPrintvalue arguments: (self printargumentsWith: printer) isOrdered: true
]
