(defvar slots '(((94 97) (31 95)) ((7 8) (11 95)) ((25 96) (3 96))))

(defun sum (list)
  (if list
    (+ (car list) (sum (cdr list)))
    0
  )
)

(defun does-contain (pair)
  (if 
    (or
      (and ; left inside right
        (>=
          (caar pair)
          (caadr pair)
        )
        (<=
          (cadar pair)
          (cadadr pair)
        )
      )
      (and ; right inside left
        (<=
          (caar pair)
          (caadr pair)
        )
        (>=
          (cadar pair)
          (cadadr pair)
        )
      )
    )
  1
  0
  )
)

; ((caar cadar) (caadr cadadr))
(defun does-overlap (pair)
  (if 
    (or
      (and ; first left inside second
        (>=
          (caar pair)
          (caadr pair)
        )
        (<=
          (caar pair)
          (cadadr pair)
        )
      )
      (and ; first right inside second
        (>=
          (cadar pair)
          (caadr pair)
        )
        (<=
          (cadar pair)
          (cadadr pair)
        )
      )
    )
  1
  (if
    (and ; second left inside first
      (>=
        (caadr pair)
        (caar pair)
      )
      (<=
        (caadr pair)
        (cadar pair)
      )
    )
    1
    0
  )
  )
)

(defvar contains (mapcar #'does-contain slots))
(write (sum contains));

(format t " ")

(defvar overlaps (mapcar #'does-overlap slots))
(write (sum overlaps))
