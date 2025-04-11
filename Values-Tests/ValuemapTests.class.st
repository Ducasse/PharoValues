"
Tests for the behavior of OrderedDictionary as Dictionary and as Value

In Pharo the superclass behaves like this

```
| od |
od := Valuemap new.
od add: #foo -> 'bar'.
od add: #foo2 -> 'bar'.
od add: #foo -> 'taz'.
od keyAtIndex: 1
> #foo
```

This means that even if we change the value the index of the associated key does not change.
"
Class {
	#name : 'ValuemapTests',
	#superclass : 'TestCase',
	#category : 'Values-Tests',
	#package : 'Values-Tests'
}

{ #category : 'Testing' }
ValuemapTests >> testAdding [
	| od od1 |
	od := Valuemap new.
	self assert: od isEmpty.
	od add: #foo -> 'bar'.
	self assert: od size equals: 1.
	self assert: (od atIndex: 1) equals: (#foo -> 'bar').
	self assert: (od at: #foo) equals: 'bar'.
	
	od at: #baz put: 'xxx'.
	self assert: od size equals: 2.
	self assert: (od atIndex: 2) equals: (#baz -> 'xxx').
	self 
		assert: (od at: #baz) 
		equals: 'xxx'.
	
	od1 := Valuemap new.
	od1 add: #foo -> 'baz'.
	od1 at: #baz put: 'yyy'.
	od addAll: od1.
	
	self assert: od size equals: 2.
	self assert: (od at: #foo) equals: 'baz'.
	self assert: (od at: #baz) equals: 'yyy'.
]

{ #category : 'Testing' }
ValuemapTests >> testAddingWithGrowth [
	"add iteratively elements, so that the dictionary must grow"

	| letters od od1 |
	letters := #(#a #b #c #d #e #f #g #h #i #j #k #l #m #n #o #p #q #r #s #t #u #v #w #x #y #z).
	od := Valuemap new.
	self 
		shouldnt: [letters do: [:symbol | od add: symbol -> symbol asString]] 
		raise: Error.
	self 
		assert: od keys asArray 
		equals: #(#a #b #c #d #e #f #g #h #i #j #k #l #m #n #o #p #q #r #s #t #u #v #w #x #y #z).
	
	od1 := Valuemap new.
	self 
		shouldnt: [letters do: [:symbol | od1 at: symbol put: symbol asString]] 
		raise: Error.
	self 
		assert: od1 keys asArray 
		equals: #(#a #b #c #d #e #f #g #h #i #j #k #l #m #n #o #p #q #r #s #t #u #v #w #x #y #z).
]

{ #category : 'Testing' }
ValuemapTests >> testComparing [
	self assert: (Valuemap with: #foo -> 'bar') = (Valuemap with: #foo -> 'bar').
	self deny: (Valuemap with: #foo -> 'bar') == (Valuemap with: #foo -> 'bar').
	self deny: (Valuemap with: #foo -> 'bar') = (Dictionary with: #foo -> 'bar').
	self deny: (Dictionary with: #foo -> 'bar') = (Valuemap with: #foo -> 'bar').
	self assert: (Valuemap with: #foo -> 'bar' with: $a -> 123) = (Valuemap with: #foo -> 'bar' with: $a -> 123).
	self deny: (Valuemap with: #foo -> 'bar' with: $a -> 123) = (Valuemap with: $a -> 123 with: #foo -> 'bar' ).
	self deny: (Valuemap with: #foo -> 'bar' with: $a -> 123) = (Valuemap with: #foo -> 123 with: $a -> 'bar' ).
	self deny: (Valuemap with: #foo -> 'bar' with: $a -> 123) = (Valuemap with: #foo -> 'bar' with: $a -> 1234).
	self deny: (Valuemap with: #foo -> 'bar' with: $a -> 123) = (Valuemap with: #foo -> 'bars' with: $a -> 123).
	self deny: (Valuemap with: #foo -> 'bar' with: $a -> 123) = (Valuemap with: #foo -> 'bar' with: $a -> 123 with: '' -> 0).
]

{ #category : 'Testing' }
ValuemapTests >> testDescribe [
	self 
		assert: Valuemap example asSource 
		equals:
'((Valuemap new: 8)
	add: #isinTitle -> ''ISIN'';
	add: #isinValue -> ''DE0009999991'';
	add: #börsenwertTitle -> ''Börsenwert'';
	add: #börsenwertValue -> ''99,9 Mrd. €'';
	add: #hochTiefTitle -> ''Hoch/Tief'';
	add: #hochTiefValue -> ''10,00/20,00'';
	add: #kgvTitle -> ''KGV'';
	add: #kgvValue -> ''9,87'';
	yourself)'
]

{ #category : 'Testing' }
ValuemapTests >> testDescribeAndReadBackNew [

	| inst |
	inst := Valuemap new.
	self assert: inst asDescription = (OpalCompiler new
			 source: inst asSource;
			 evaluate) asDescription
]

{ #category : 'Testing' }
ValuemapTests >> testEnumeration [
	| od keys |
	od := Valuemap new.
	od add: #foo -> 'bar'.
	od at: #baz put: 'xxx'.
	od associationsDo: [:assoc |
		self assert: (assoc isKindOf: Association).
		self assert: assoc key isSymbol.
		self assert: assoc value isString].
	self assert: od keys asArray = #(#foo #baz).
	self assert: od values asArray = #('bar' 'xxx').
	keys := OrderedCollection new.
	od keysDo: [:k | keys add: k].
	self assert: keys asArray = #(#foo #baz).
]

{ #category : 'Testing' }
ValuemapTests >> testIndexOf [
	| od |
	od := Valuemap new.
	self assert: od isEmpty.
	self assert: (od indexOf: #foo) isZero.
	od add: #foo -> 'bar'.
	self assert: od size = 1.
	self assert: (od indexOf: #foo) = 1.
	self assert: (od indexOf: #baz) isZero.
	od at: #baz put: 'xxx'.
	self assert: od size = 2.
	self assert: (od indexOf: #baz) = 2.
]

{ #category : 'Testing' }
ValuemapTests >> testIndexedAccess [
	| od |
	od := Valuemap new.
	od add: #foo -> 'bar'.
	self assert: od size equals: 1.
	self assert: (od atIndex: 1) equals: (#foo -> 'bar').
	self should: [od atIndex: 0] raise: Error.
	self should: [od atIndex: 2] raise: Error.
	self should: [od atIndex: #key] raise: Error.
	self should: [od atIndex: '1'] raise: Error.
]

{ #category : 'Testing' }
ValuemapTests >> testKeyedAccess [
	| od |
	od := Valuemap new.
	od add: #foo -> 'bar'.
	od at: #baz put: 'xxx'.
	self assert: od size = 2.
	self assert: (od at: #foo) = 'bar'.
	self assert: (od at: #baz) = 'xxx'.
	self should: [od at: #bar] raise: KeyNotFound.
	self assert: (od at: #bar ifAbsent: [nil]) isNil.
]

{ #category : 'Testing' }
ValuemapTests >> testRemoving [
	| od |
	od := Valuemap new.
	self assert: od isEmpty.
	self should: [od removeKey: #foo] raise: KeyNotFound.
	self shouldnt: [od removeKey: #foo ifAbsent: nil] raise: KeyNotFound.
	self assert: (od removeKey: #foo ifAbsent: nil) isNil.
	od add: #foo -> 'bar'.
	self assert: od size = 1.
	self assert: od keys asArray = #(#foo).
	self assert: (od removeKey: #foo) = 'bar'.
	self assert: od size = 0.
	self assert: od keys asArray = #().
	od add: #foo -> 'bar'.
	od at: #baz put: 'xxx'.
	self assert: od size = 2.
	self assert: od keys asArray = #(#foo #baz).
	self should: [od removeKey: #zzz] raise: KeyNotFound.
	self shouldnt: [od removeKey: #zzz ifAbsent: nil] raise: KeyNotFound.
	self assert: od size = 2.
	self assert: od keys asArray = #(#foo #baz).
	self assert: (od removeKey: #foo) = 'bar'.
	self assert: od size = 1.
	self assert: od keys asArray = #(#baz)
]
