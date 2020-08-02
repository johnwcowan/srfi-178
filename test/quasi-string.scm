(define (check-quasi-string-ops)
  (print-header "Checking quasi-string operations...")

  (check (bitvector-prefix-length (bitvector 1 0 0) (bitvector 1 0 1)) => 2)
  (check (bitvector-prefix-length (bitvector) (bitvector 1 0 1))       => 0)
  (let ((bvec (bitvector 1 0 1)))
    (check (= (bitvector-prefix-length bvec bvec) (bitvector-length bvec))
     => #t)
    (check (= (bitvector-suffix-length bvec bvec) (bitvector-length bvec))
     => #t))
  (check (bitvector-suffix-length (bitvector 1 0 0) (bitvector 0 0 0)) => 2)
  (check (bitvector-suffix-length (bitvector) (bitvector 1 0 1))       => 0)
)
