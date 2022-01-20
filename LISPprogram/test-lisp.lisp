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

(defun foo (a 
