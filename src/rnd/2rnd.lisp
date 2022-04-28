
(in-package :rnd)

(veq:fvprogn

(veq:def* 2on-line ((:varg 2 a b))
  (declare #.*opt* (veq:ff a b))
  (veq:f2from a (veq:f2- b a) (rnd)))

(veq:def* 2non-line (n (:varg 2 a b))
  (declare #.*opt* (weird:pos-int n) (veq:ff a b))
  (veq:fwith-arrays (:n n :itr k
    :arr ((arr 2))
    :fxs ((f () (2on-line a b)))
    :exs ((arr k (f))))
    arr))


(veq:def* 2in-rect ((:varg 2 s))
  (declare #.*opt* (veq:ff s))
  (values (rnd* (:vref s 0)) (rnd* (:vref s 1))))

(veq:def* 2in-square (&optional (s 1f0))
  (declare #.*opt* (veq:ff s))
  (2in-rect s s))

(veq:def* 2nin-rect (n (:varg 2 s))
  (declare #.*opt* (weird:pos-int n) (veq:ff s))
  (veq:fwith-arrays (:n n :itr k
    :arr ((a 2))
    :fxs ((f () (2in-rect s)))
    :exs ((a k (f))))
    a))

(veq:def* 2nin-square (n &optional (s 1f0))
  (declare #.*opt* (weird:pos-int n) (veq:ff s))
  (veq:fwith-arrays (:n n :itr k
    :arr ((a 2))
    :fxs ((f () (2in-square s)))
    :exs ((a k (f))))
    a))


(veq:def* 2on-circ (&optional (r 1f0))
  (declare #.*opt* (veq:ff r))
  (veq:f2scale (veq:fcos-sin (rnd veq:fpii)) r))

(veq:def* 2non-circ (n &optional (r 1f0))
  (declare #.*opt* (veq:ff r))
  (veq:fwith-arrays (:n n :itr k
    :arr ((a 2))
    :fxs ((f () (2on-circ r)))
    :exs ((a k (f))))
    a))

(veq:def* 2in-circ (&optional (r 1f0))
  (declare #.*opt* (veq:ff r))
  (let ((a (rnd)) (b (rnd)))
    (declare (veq:ff a b))
    (if (< a b) (setf a (* veq:fpii (/ a b)) b (* b r))
                (let ((d a)) (setf a (* veq:fpii (/ b a)) b (* d r))))
    (values (* (cos a) b) (* (sin a) b))))

(veq:def* 2nin-circ (n &optional (r 1f0))
  (declare #.*opt* (veq:ff r))
  (veq:fwith-arrays (:n n :itr k
    :arr ((a 2))
    :fxs ((f () (2in-circ r)))
    :exs ((a k (f))))
    a)))

