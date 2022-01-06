(defun testcond (x)
  (cond ((> x 0) x)
	((eql x 42) 42)
	(T (- x))))

(defun list-ref (list n)
  (if (<= n 0)
      (car list)
      (list-ref (cdr list) (- n 1))))

(defun lunghezza (l)
  (if (null l)
      0
      (+ 1 (lunghezza (cdr l)))))
