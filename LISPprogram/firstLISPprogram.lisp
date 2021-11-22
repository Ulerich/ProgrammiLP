(defun member (item list)
  (cond ((null list) nil)
	((equal item (first list)) T)
	(T (member item (rest list)))))
