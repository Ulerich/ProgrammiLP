(defun perdue(x)
  (cond ((numberp x) (* x 2))))

(defun lung (lista)  ; commento
  (cond ((null lista) 9)
   (T (+ 1 (lung (cdr lista))))))
