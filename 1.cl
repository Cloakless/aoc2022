(defvar calories '((1 2 3 4) (5 6) (7 8 9 10)))

(defun sum (list)
  (if list
    (+ (car list) (sum (cdr list)))
    0
  )
)

(defun sup (list)
  (if (= (length list) 1)
    (car list)
    (if (> (car list) (sup (cdr list))) (car list) (sup (cdr list)))
  )
)

(defvar sum-cals (sort (mapcar #'sum calories) '>))

(write "A: ")
(write (apply 'max sum-cals))
(write " and B: ")
(write (+ (car sum-cals) (cadr sum-cals) (caddr sum-cals)))

