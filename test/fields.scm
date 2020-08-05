(define (check-bit-field-operations)
  (print-header "Checking bit field operations...")

  (check (bitvector-field-any? (bitvector 0 1 0 0) 0 4) => #t)
  (check (bitvector-field-any? (bitvector 0 0 0 0) 0 4) => #f)
  (check (bitvector-field-any? (bitvector 0 1 0 0) 1 3) => #t)
  (check (bitvector-field-any? (bitvector 0 1 0 0) 2 4) => #f)

  (check (bitvector-field-every? (make-bitvector 4 1) 0 4) => #t)
  (check (bitvector-field-every? (bitvector 1 1 1 0) 0 4) => #f)
  (check (bitvector-field-every? (bitvector 1 1 0 0) 0 2) => #t)
  (check (bitvector-field-every? (bitvector 1 1 0 0) 2 4) => #f)

  (check (bitvector= (bitvector-field-clear (make-bitvector 4 1) 0 2)
                     (bitvector 0 0 1 1))
   => #t)
  (let ((bvec (make-bitvector 4 1)))
    (check (bitvector= (begin (bitvector-field-clear! bvec 0 2) bvec)
                       (bitvector 0 0 1 1))
     => #t))
  (check (bitvector= (bitvector-field-set (make-bitvector 4 0) 0 2)
                     (bitvector 1 1 0 0))
   => #t)
  (let ((bvec (make-bitvector 4 0)))
    (check (bitvector= (begin (bitvector-field-set! bvec 0 2) bvec)
                       (bitvector 1 1 0 0))
     => #t))

  ;;; replace

  (check
   (bitvector=
    (bitvector-field-replace-same (make-bitvector 4 0)
                                  (make-bitvector 4 1)
                                  1
                                  3)
    (bitvector 0 1 1 0))
   => #t)
  (let ((bvec (make-bitvector 4 0)))
    (check
     (bitvector= (begin
                  (bitvector-field-replace-same! bvec
                                                 (make-bitvector 4 1)
                                                 1
                                                 3)
                  bvec)
                 (bitvector 0 1 1 0))
     => #t))
  (let ((bvec (make-bitvector 4 0)))
    (check
     (bitvector= (begin
                  (bitvector-field-replace! bvec (make-bitvector 4 1) 1 3)
                  bvec)
                 (bitvector 0 1 1 0))
     => #t))

  ;;; reverse!

  (let ((bvec (bitvector 0 1 0 1 1)))
    (check
     (bitvector= (begin (bitvector-field-reverse! bvec 0 5) bvec)
                 (bitvector 1 1 0 1 0))
     => #t))
  (let ((bvec (bitvector 0 1 0 1 1)))
    (check
     (bitvector= (begin (bitvector-field-reverse! bvec 1 3) bvec)
                 (bitvector 0 0 1 1 1))
     => #t))

  ;;; flip

  (check (bitvector= (bitvector-field-flip (bitvector 0 1 0 1) 0 4)
                     (bitvector 1 0 1 0))
   => #t)
  (check (bitvector= (bitvector-field-flip (bitvector 0 1 0 1) 2 4)
                     (bitvector 0 1 1 0))
   => #t)
  (let ((bvec (bitvector 0 1 0 1)))
    (check (bitvector= (begin (bitvector-field-flip! bvec 0 4) bvec)
                       (bitvector 1 0 1 0))
     => #t))
  (let ((bvec (bitvector 0 1 0 1)))
    (check (bitvector= (begin (bitvector-field-flip! bvec 2 4) bvec)
                       (bitvector 0 1 1 0))
     => #t))
)