        DOUBLE PRECISION FUNCTION PPND(P,IER)
C
C       ALGORITHM AS 111, APPL.STATIST., VOL.26, 118-121, 1977.
C
C       PRODUCES NORMAL DEVIATE CORRESPONDING TO LOWER TAIL AREA = P.
C
C       See also AS 241 which contains alternative routines accurate to
C       about 7 and 16 decimal digits.
C
        IMPLICIT DOUBLE PRECISION (A-H,O-Z)
        DATA SPLIT/0.42D0/
        DATA A0,A1,A2,A3/2.50662823884D0,-18.61500062529D0,
     1  41.39119773534D0,-25.44106049637D0/, B1,B2,B3,B4/
     2  -8.47351093090D0,23.08336743743D0,-21.06224101826D0,
     3  3.13082909833D0/, C0,C1,C2,C3/-2.78718931138D0,-2.29796479134D0,
     4  4.85014127135D0,2.32121276858D0/, D1,D2/3.54388924762D0,
     5  1.63706781897D0/
        DATA ZERO/0.D0/, ONE/1.D0/, HALF/0.5D0/
C
        IER = 0
        Q = P-HALF
        IF (ABS(Q).GT.SPLIT) GO TO 10
C
C       0.08 < P < 0.92
C
        R = Q*Q
        PPND = Q*(((A3*R + A2)*R + A1)*R + A0)/((((B4*R + B3)*R + B2)*R
     1          + B1)*R + ONE)
        RETURN
C
C       P < 0.08 OR P > 0.92, SET R = MIN(P,1-P)
C
   10   R = P
        IF (Q.GT.ZERO) R = ONE-P
        IF (R.LE.ZERO) GO TO 20
        R = SQRT(-LOG(R))
        PPND = (((C3*R + C2)*R + C1)*R + C0)/((D2*R + D1)*R + ONE)
        IF (Q.LT.ZERO) PPND = -PPND
        RETURN
   20   IER = 1
        PPND = ZERO
        RETURN
        END
        