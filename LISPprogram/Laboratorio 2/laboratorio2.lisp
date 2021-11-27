;inverte una lista
(defun inverte (lista)
  (cond ((null lista) nil)
	(T (append (inverte (cdr lista))
		   (list (car lista))))))

;verifica se una lista è palindroma
(defun palp (lista)
  (equal lista (inverte lista)))

;elimina i livelli di profondità di una lista
(defun app (lista)
  (cond ((null lista) lista)
	((listp (car lista))
		(append (app (car lista)) (app (cdr lista))))
	(T (cons (car lista) (app (cdr lista))))))

;duplica la lista
(defun dup (lista)
  (cond ((null lista) nil)
	(T (append (list (car lista) (car lista)) (dup (cdr lista))))))

; funziona ausiliaria per molt
(defun nvolte (x n)
  (cond ((= n 0) nil)
	(T (cons x (nvolte x (- n 1))))))

; moltiplica la lista n volte
(defun molt (lista n)
  (cond ((null lista) nil)
	(T (append (nvolte (car lista) n) (molt (cdr lista) n)))))

;; elimina gli elementi alla n-esima posizione

(defun elimina (lista n)
  (cond ((null lista) nil)
	((= n 0) (elimina (cdr lista) n))
	(T (append (list (car lista)) (elimina (cdr lista) (- n 1))))))

;; soluzione Rafael
(defun elimaux (lista n pos)
  (cond ((null lista) nul)
	((= n pos) (elimaux (cdr lista) n 1))
	(T (cons (car lista) (elimaux (cdr lista) n (+ pos 1))))))

(defun elimina2 (lista n)
  (elimaux lista n 1))

(defun rotan (lista n)
  (cond ((= n 0) lista)
	((< n 0) (inverte lista) (- n))
	(T (append (cdr lista) (list (car lista)))
	   (- n 1))))

				  
