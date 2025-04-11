Extension { #name : 'Class' }

{ #category : '*Values-testing' }
Class >> isInScope: aClass [
	"<Boolean>
	true if aClass is visible by the receiver - aClass can be used in the source without namespace qualifier.
	false when aClass cannot be seen by the receiver - use the fullName"
	"All classes are globally visible in Squeak"

	^true
]

{ #category : '*Values-accessing' }
Class >> nameRelativeTo: targetClass [
	"<String>"
	"self nameRelativeTo: Object"
	"there are no namespaces in Squeak"

	^self name asString
]
