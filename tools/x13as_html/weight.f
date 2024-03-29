C     Last change:  BCM  21 Nov 97   10:42 pm
**==weight.f    processed by SPAG 4.03F  at 09:55 on  1 Mar 1994
      SUBROUTINE weight(A,B,I1,I2,Mq)
      IMPLICIT NONE
C*** Start of declarations inserted by SPAG
      DOUBLE PRECISION A,B,cent,endw,end10,end11,end12,end7,end8,end9,
     &                 qcent,qend,qend3,qend4
      INTEGER i,I1,I2,j,j1,j2,k,l1,l2,m1,m2,Mq
C*** End of declarations inserted by SPAG
C  THIS SUBROUTINE PRODUCES WEIGHTS FOR THE CENTERED 24-TERM (MONTHLY)
C  MOVING AVERAGE (CENTERED 8-TERM QUARTERLY MOVING AVERAGE)
C  FOR THE PRELIMINARY ESTIMATION OF THE TREND-CYCLE.
      INCLUDE 'srslen.prm'
      DIMENSION cent(25),A(PLEN),B(PLEN),endw(6,24)
      DIMENSION qcent(9),qend(2,8),qend4(8),qend3(8)
      DIMENSION end12(24),end11(24),end10(24),end9(24),end8(24),end7(24)
      DATA cent/
     & -0.0112773D0,-0.0273401D0,-0.0195570D0,-0.0053389D0, 0.0113162D0,
     &  0.0274075D0, 0.0416667D0, 0.0559258D0, 0.0720171D0, 0.0886723D0,
     &  0.1028903D0, 0.1106735D0, 0.1058879D0, 0.1106735D0, 0.1028903D0,
     &  0.0886723D0, 0.0720171D0, 0.0559258D0, 0.0416667D0, 0.0274075D0,
     &  0.0113162D0,-0.0053389D0,-0.0195570D0,-0.0273401D0,-0.0112773D0/
      DATA end12/
     & -0.0225546D0,-0.0234459D0,-0.0160151D0,-0.0026792D0, 0.0121628D0,
     &  0.0279138D0, 0.0413240D0, 0.0564321D0, 0.0728637D0, 0.0913320D0,
     &  0.1064322D0, 0.1145676D0, 0.1058879D0, 0.1067793D0, 0.0993484D0,
     &  0.0860125D0, 0.0711706D0, 0.0554195D0, 0.0420093D0, 0.0269012D0,
     &  0.0104697D0,-0.0079986D0,-0.0230988D0,-0.0312343D0/
      DATA end11/
     & -0.0106354D0,-0.0195678D0,-0.0208123D0,-0.0144215D0,-0.0026399D0,
     &  0.0121064D0, 0.0272793D0, 0.0432593D0, 0.0595187D0, 0.0811315D0,
     &  0.1018984D0, 0.1178834D0, 0.0939688D0, 0.1029011D0, 0.1041457D0,
     &  0.0977549D0, 0.0859732D0, 0.0712269D0, 0.0560541D0, 0.0400741D0,
     &  0.0238147D0, 0.0022018D0,-0.0185651D0,-0.0345500D0/
      DATA end10/
     &  0.0019024D0,-0.0124004D0,-0.0214279D0,-0.0229499D0,-0.0159235D0,
     & -0.0036926D0, 0.0116272D0, 0.0297519D0, 0.0471940D0, 0.0692546D0,
     &  0.0931847D0, 0.1151461D0, 0.0814309D0, 0.0957337D0, 0.1047612D0,
     &  0.1062832D0, 0.0992569D0, 0.0870260D0, 0.0717061D0, 0.0535814D0,
     &  0.0361393D0, 0.0140787D0,-0.0098514D0,-0.0318128D0/
      DATA end9/
     &  0.0121814D0,-0.0035929D0,-0.0177541D0,-0.0263876D0,-0.0255157D0,
     & -0.0176449D0,-0.0039735D0, 0.0141749D0, 0.0338072D0, 0.0566876D0,
     &  0.0805875D0, 0.1057635D0, 0.0711520D0, 0.0869263D0, 0.1010874D0,
     &  0.1097209D0, 0.1088491D0, 0.1009782D0, 0.0873068D0, 0.0691584D0,
     &  0.0495261D0, 0.0266457D0, 0.0027458D0,-0.0224301D0/
      DATA end8/
     &  0.0181990D0, 0.0047570D0,-0.0107207D0,-0.0239906D0,-0.0292988D0,
     & -0.0274358D0,-0.0176746D0,-0.0019316D0, 0.0172443D0, 0.0407996D0,
     &  0.0654582D0, 0.0895942D0, 0.0651343D0, 0.0785764D0, 0.0940541D0,
     &  0.1073239D0, 0.1126322D0, 0.1107692D0, 0.1010079D0, 0.0852650D0,
     &  0.0660891D0, 0.0425338D0, 0.0178751D0,-0.0062608D0/
      DATA end7/
     &  0.0192206D0, 0.0109225D0,-0.0021151D0,-0.0163613D0,-0.0263849D0,
     & -0.0309178D0,-0.0270820D0,-0.0170193D0,-0.0009008D0, 0.0188178D0,
     &  0.0438290D0, 0.0696580D0, 0.0641127D0, 0.0724108D0, 0.0854485D0,
     &  0.0996946D0, 0.1097182D0, 0.1142511D0, 0.1104153D0, 0.1003527D0,
     &  0.0842342D0, 0.0645156D0, 0.0395043D0, 0.0136754D0/
      DATA qcent/
     & -0.0258462D0,-0.0208718D0, 0.1250000D0, 0.2708718D0, 0.3016923D0,
     &  0.2708718D0, 0.1250000D0,-0.0208718D0,-0.0258462D0/
      DATA qend4/
     & -0.0516923D0, 0.0012821D0, 0.1323846D0, 0.2930256D0, 0.3016923D0,
     &  0.2487179D0, 0.1176154D0,-0.0430256D0/
      DATA qend3/
     & -0.0036410D0,-0.0579487D0, 0.0079487D0, 0.1786410D0, 0.2536410D0,
     &  0.3079487D0, 0.2420513D0, 0.0713590D0/
      DO i=I1,I2
       B(i)=0D0
      END DO
      IF(Mq.ne.2)THEN
       j1=I1+12
       j2=I2-12
       DO i=j1,j2
        B(i)=cent(13)*A(i)
        DO j=1,12
         B(i)=B(i)+cent(13-j)*A(i-j)+cent(13+j)*A(i+j)
        END DO
       END DO
       DO j=1,24
        endw(1,j)=end12(j)
        endw(2,j)=end11(j)
        endw(3,j)=end10(j)
        endw(4,j)=end9(j)
        endw(5,j)=end8(j)
        endw(6,j)=end7(j)
       END DO
       DO i=1,6
        l1=j1-i
        l2=j2+i
        DO k=1,24
         m1=l1+i+12-k
         m2=l2-i-12+k
         B(l1)=B(l1)+endw(i,k)*A(m1)
         B(l2)=B(l2)+endw(i,k)*A(m2)
        END DO
       END DO
       RETURN
      END IF
      j1=I1+4
      j2=I2-4
      DO i=j1,j2
       B(i)=qcent(5)*A(i)
       DO j=1,4
        B(i)=B(i)+qcent(5-j)*A(i-j)+qcent(5+j)*A(i+j)
       END DO
      END DO
      DO j=1,8
       qend(1,j)=qend4(j)
       qend(2,j)=qend3(j)
      END DO
      DO i=1,2
       l1=j1-i
       l2=j2+i
       DO k=1,8
        m1=l1+i+4-k
        m2=l2-i-4+k
        B(l1)=B(l1)+qend(i,k)*A(m1)
        B(l2)=B(l2)+qend(i,k)*A(m2)
       END DO
      END DO
      RETURN
      END
