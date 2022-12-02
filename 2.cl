(defvar moves '(((A) (X)) ((C) (X)) ((C) (X)) ((C) (X)) ((B) (Y))))

(defun sum (list)
  (if list
    (+ (car list) (sum (cdr list)))
    0
  )
)

(defun score (list)
  (+ (choice-score list) (move-score list)
  )
)

(defun score2 (list)
  (+ (choice-score2 list) (move-score2 list)
  )
)

(defun choice-score (pair)
  (if (equal (caadr pair) 'X) 
  1
  (if (equal (caadr pair) 'Y)
  2
  3)
  )
)

(defun move-score (pair)
  (if (equal (caar pair) 'A) 
    (if (equal (caadr pair) 'X)
      3
      (if (equal (caadr pair) 'Y)
        6
        0
      )
    )
    (if (equal (caar pair) 'B)
      (if (equal (caadr pair) 'Y)
        3
        (if (equal (caadr pair) 'Z)
          6
          0
        )
      )
      (if (equal (caadr pair) 'Z)
        3
        (if (equal (caadr pair) 'X)
          6
          0
        )
      )
    )
  )
)

(defun sum (list)
  (if list
    (+ (car list) (sum (cdr list)))
    0
  )
)

(defun choice-score2 (pair)
  (if (equal (caar pair) 'A) 
    (if (equal (caadr pair) 'X)
      3
      (if (equal (caadr pair) 'Y)
        1
        2
      )
    )
    (if (equal (caar pair) 'B)
      (if (equal (caadr pair) 'Y)
        2
        (if (equal (caadr pair) 'Z)
          3
          1
        )
      )
      (if (equal (caadr pair) 'Z)
        1
        (if (equal (caadr pair) 'X)
          2
          3
        )
      )
    )
  )
)

(defun move-score2 (pair)
  (if (equal (caadr pair) 'X) 
  0
  (if (equal (caadr pair) 'Y)
  3
  6)
  )
)

(defun score2 (list)
  (+ (choice-score2 list) (move-score2 list)
  )
)

(defvar sum-scores (sort (mapcar #'score moves) '>))
(write (sum sum-scores))

(format t " ")

(defvar sum-scores2 (sort (mapcar #'score2 moves) '>))
(write (sum sum-scores2))
