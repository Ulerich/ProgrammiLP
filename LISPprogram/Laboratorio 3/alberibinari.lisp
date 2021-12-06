;; (nodo key value lef right)
;; (albero name root)

(defun crea-nodo (k v &optional left right) ;definisco la funzione che mi crea un nodo con i parmaetri k v (chiave e valore) obbligatori, opzionalmente posso inserire left o right
  (list 'nodo k v left right)) ;; con ' dico che la lista deve avere come primo elemento nodo
 
(defun crea-albero (name &optional root)
  (list 'albero name root))

(defun nodop (l)
  (cond ((null l) T)
  (T (and (listp l)
	  (= (length l) 5)
	  (eq (car l) 'nodo)
	  (nodop (fourth l))
	  (nodop (fifth l))))))

(defun nodo-chiave (n)
  (second n))

;(defun cerca-albero (t k)
;  (cerca-nodo (third t) k))

;; da implementare cerca-nodo, cerca la chiave nell'albero e ci ritorna il valore
;; corrispondente

; insert-nodo, attraverso la chiave cerca il nodo e lo sostituisce se non esiste lo mette in fondo

(defun insert-nodo (n k v)
  (cond ((null n) (crea-nodo k v))
	((< (second n) k)
	 (crea-nodo (second n) (third n) (fourth n) 
		    (insert-nodo (fifth n) k v)))
	((= (second n) k)
	 (crea-nodo (second n) v (fourth n) (fifth n)))
	((> (second n) k)
	 (crea-nodo (second n) (third n)
		    (insert-nodo (fourth n) k v) (fifth n)))))

(defun cerca-nodo (n k)
  (cond ((null n) nil)
	((< (second n) k) (cerca-nodo (fifth n) k))
	((= (second n) k) (third n))
	((> (second n) k) (cerca-nodo (fourth n) k))))

(defun cerca-albero (t k)
  (let ((nt (cerca-nodo (third t) k)))
    (cond (nt (values (third nt) t))
	  (T (values nil nil)))));; posso usare questo condizionale per sapere già se la lista è vuota o
	     			 ;;meno perchè se è vuota restituisce nil

(defun node-inorder (n) ;;stampa albero in ordine di chiave)
  (when n
    (append (node-inorder (fourth n))
	    (list (third n)
		  (node-inorder (fifth n))))))
			  ;; è come un if, controllerà una proprietà booleana e
    	  		  ;;se è vero segue quello che viene dopo se no ritorna nil

(defun node-preorder (n) ;;stampa albero in ordine di chiave)
  (when n
    (append (node-preorder (third n))
            (list (third n)
                  (node-preorder (fifth n))))))
                          ;; when è come un if, controllerà una proprietà booleana e
                          ;;se è vero segue quello che viene dopo se no ritorna nil

(defun enumera (tr &optional (mode :inorder))
  (case mode
    (:inorder (node-inorder (third tr)))
    (:preorder (node-preorder (third tr)))
    (:postorder (node-postorder (third tr)))))
;; Per avere un default metto un T (true), in questo caso se l'input non corrisponde a nessun caso la funzione ritorna nil
