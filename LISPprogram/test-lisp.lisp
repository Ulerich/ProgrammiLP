;; Slide 3

(defun sum (l)
  (if (null l)
      0
    (+ (first l) (sum (rest l)))))

(defun count-atoms(x)
  (cond ((null x) 0)
        ((atom x) 1)
        (T (+ (count-atoms(first x))
              (count-atoms(rest x))))))

(defun scala-lista (l fattore)
  (if (null l)
      nil
    (cons (* (car l) fattore)
          (scala-lista (cdr l) fattore))))

(defun flatten (x)
  (cond ((null x) x)
	((atom x) (list x))
	(T (append (flatten (first x))
		   (flatten (rest x))))))

(defun mirror (x)
  (if (atom x)
      x
      (append (mirror (rest x))
	      (list (mirror (first x))))))

(defun inverti (x)
  (cond ((null x) x)
	((atom x) x)
	(T (cons-end (first x)
		     (inverti (rest x))))))

(defun cons-end (s x)
	(if (null x)
	    (list s)
	    (cons (first x)
	          (cons-end s (rest x)))))

(defun circulate (l dir)
  (cond ((null l) l)
	((atom l) l)
	((eq dir 'left)
	 (append (rest l)(list (first l))))
	((eq dir 'right)
	 (cons (last l) l))
	(T l)))

;; Slide 4
;; mapcar

(defun scala-4 (x) (* x 4))

(defun scala-lista-4 (lista)
  (mapcar 'scala-4 lista))

;; Lambda expression

(defun adder-x (x)
  (lambda (y) (+ x y)))

(defparameter adder-42 (adder-x 42))

(defun f-test (x y)
  ((lambda (a b)
     (+ a y))))

(defun quadrato (x)
  (* x x))

(defun f (x y)
  ((lambda (a b)
     (+ (* x (quadrato a))
	(* y b)
	(* a b)))
   (+ 1 (* x y))
   (- 1 y)))

(defun let-f (x y)
  (let ((a (+ 1 x))
	(b (+ 1 y)))
    (+ a y)))

(defun lambda-f (x y)
  ((lambda (a b)
     (+ a x))
   (+ x y)))

(defun lf (x y)
  ((lambda (a b)
     (+ x a))
   x))

;; funzioni di ordine superiore

(defun compose (f g)
	   (lambda (x)
		(funcall f (funcall g x))))

(defun filter (predicato lista)
   (cond ((null lista) nil)
		    ((funcall predicato (car lista))
          (cons (car lista)
                (filter predicato (cdr lista)))
		     (T (filter predicato (cdr lista))))))

(defun listanum (l x)
  (cond ((eql (car l) x) x)
	((null (car l)) (cons l (cdr l)))
	(T (append (listanum (cdr l) x) (listanum((car l) x))))))

(defun list-ref (n l)
  (if (<= n 0)
      (car l)
      (list-ref (- n 1) (cdr l))))

(defun lunghezza (l)
  (if (null (car l))
      0
      (+ 1 (lunghezza (cdr l)))))

(defun prof (l)
  (cond ((null l) 1)
	((atom l) 0)
	(T (max (+ 1 (prof (car l)))
		   (prof (cdr l))))))

(defun prof2 (x) ;;equivalente con first e rest
	(cond ((null x) 1)
	      ((atom x) 0)
	      (t (max (+ 1 (prof2 (first x)))
	              (prof2 (rest x))))))

(defun circulate (lst direction)
	(cond ((atom lst) lst)
	      ((null lst) nil)
	      ((eq direction 'left)
	       (append (cdr lst) (list (car lst))))
	      ((eq direction 'right)
	       (cons (last-l lst) (but-last lst)))
	      (T lst) ))

