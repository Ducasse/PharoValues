Extension { #name : #Valuemap }

{ #category : #'*Values-Tests-test instances' }
Valuemap class >> example [
	"self example"

	| state |
	state := Valuemap new.
	state at: #isinTitle put: 'ISIN'.
	state at: #isinValue put: 'DE0009999991'.
	state at: #börsenwertTitle put: 'Börsenwert'.
	state at: #börsenwertValue put: '99,9 Mrd. €'.
	state at: #hochTiefTitle put: 'Hoch/Tief'.
	state at: #hochTiefValue put: '10,00/20,00'.
	state at: #kgvTitle put: 'KGV'.
	state at: #kgvValue put: '9,87'.
	^state
]
