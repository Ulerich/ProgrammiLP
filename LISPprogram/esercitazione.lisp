(defun inverti (x)
    (cond ((null x) x)
          ((atom x) x)
          (T (cons-end (first x)
            (inverti (rest x))))))                                              