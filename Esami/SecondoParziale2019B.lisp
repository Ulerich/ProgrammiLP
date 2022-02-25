;; ES 1
(defun f (lista)
  (cond ((null lista) nil)
	((listp (car lista)) (cons (f (car lista)) (f (cdr lista))))
	((and (numberp (car lista)) (oddp (car lista)))(cons (+ (car lista) 1) (f (cdr lista))))
	(T (cons (car lista) (f (cdr lista))))))

;; ES 2

(defun f (x y)
  ((lambda (a b)
    (+ (* x a)
       (* y (quadrato b))
       (* a b)))
   ((+ x (* x y))(* 4 y))))

;; ES 3

(defun c ()
  (cons 'a 
      (cons 
	(cons 'c) 
	(cons 
	  (cons 'd nil) 
	  (cons 'e nil) 
      nil))))

;; ES 4
;;

(defun what (l1 l2)
  (cond
    ((null l1) 0)
    ((null l2) 0)
    ((member (car l1) l2) (+ 1 (what (cdr l1) l2)))
    (T (what (cdr l1) l2)))

;;  Definizione di un puntatore a una costante di tipo puntatore a un carattere)
;; char* const* p
