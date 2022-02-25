; #Es1
; La funzione riceve una funziona e una lista
; La funzione applica la funziona a un elemento sì e uno della lista e ritorna una lista

; Es2

(defun f (l)
  (cond ((null l) nil)
	((listp (car l)) (cons (f (car l)) (f (cdr l))))
	((and (numberp (car l)) (oddp (car l)))(cons (per-due (car l)) (f (cdr l))))
	(T (cons (car l) (f (cdr l))))))


(defun per-due (x)
  (* x 2))i

; #Es 3
; La ricorsione è un tipo di ricorsione che caratterizza programmi dove l'ultima funzione eseguta
; è la chiamata ricorsiva, questo permette di non creare un activation frame sullo stack, ma di usare
; semplicemente un jump, con vantaggi in termini di memoria occupata

(defun fatt (x n)
  (if ((= x 0)
       acc)
    (fatt (x (- n 1)))))

(defun fibonacci (x)
  (cond ((= x 0) 1)
	((= x 1) 1)
	(T (+ (fibonacci(- x 1)) (fibonacci(- x 2))))))

;; #Es 4
;; Riscrivere la funzione let come una lambda
(defun f-lambda (x y)
  ((lambda (a b)
     (+ (* a (* x x)
	   (* y b)
	   (* a b)))
     (* (sin (* 2 x y)) pi) (* 2 a))))

;; #Es 5
;; (cons a (cons (cons (cons b nil) cons c nil) nil) cons (cons a b))
