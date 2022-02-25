;; Funzione che ha per argomento una lista, da t se è piatta

(defun lista (l)
  (cond ((null l) T)
	((listp (car l)) nil)
	(T (lista (cdr l)))))

;; (a b (c)(d((e))))

(cons a (cons b (cons (cons c nil) cons d (cons (cons e nil)))))
