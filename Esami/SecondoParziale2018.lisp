;# Es 1
;La funzione richiede un valore, un numero e una lista
; La funziona aggiunge il valore inserito nell'n-esimo posto della lista data,
; se il valore è più grande della lunghezza
; della lista il valore viene aggiunto alla fine
; La funzione restituisce la lista con il valore aggiunto

;# Es 2
(defun f (lista)
  (cond ((null lista) (cons lista)
	((and (atom lista) (evenp lista))(list (aggiungi-42 lista)))
	((and (atom lista) (oddp lista))(list lista))
	(T (append (cons (f (car lista)) nil) (f (cdr lista))))))

(defun aggiungi-42 (x)
  (+ 42 x))

; Es 3
; 1. Espressioni il cui valore ha la stessa rappresentazione tipografica dell’espressione tipografica che li denota.
; 	Sono per esempio Stringhe e numeri.

; 2. Una lambda expression è una funzione anonima, questo significa che possiamo scrivere una funzione senza assegnare
; un nome ad essa. Questo porta numerosi vantaggi, come scrivere una funzione all'interno di una funzione per 
; poter avere valori intermedi da restituire alla funzione principale, oppure è possibile scrivere come valore di
; ritorno una funzione stessa.
