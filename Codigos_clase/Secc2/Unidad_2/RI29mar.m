%% RI S2 15marzo
clear
close all
l1=5
A(1)= Link([0 l1 0 pi/2 0]); %Generar cada una de las articulaciones 
A(2)= Link([0 0 0 -pi/2 0]);%th,d,a,alpha, tipo art; 0=rot 1=pris
A(3)= Link([0 0 0 0 1]);
A(3).qlim = [0 5];
Robot= SerialLink(A, 'name', 'Esferico'); %Unir articulaciones
%figure
%Robot.teach
syms q1 q2 q3
aAb=trotz(q1)*transl(0,0,l1)*transl(0,0,0)*trotx(pi/2)
bAc=trotz(q2)*transl(0,0,0)*transl(0,0,0)*trotx(-pi/2)
cAd=trotz(0)*transl(0,0,q3)*transl(0,0,0)*trotx(0)
syms nx ny nz ox oy oz ax ay az px py pz
noap=[nx ox ax px;ny oy ay py;nz oz az pz;0 0 0 1]
aAb*bAc*cAd==noap
%Paso 1
p1izq=inv(aAb)*noap
p1izq=simplify(p1izq)
p1der=bAc*cAd
p1izq==p1der
ec1=p1izq(3,4)==p1der(3,4)
a=-py
b=px
q1_sol1=atan2(a,-b)
q1_sol2=atan2(-a,b)
T=Robot.fkine([pi pi/2 2.5])
pos=T.t
px=pos(1)
py=pos(2)
pz=pos(3)
q1_sol1=eval(q1_sol1)
q1_sol1=vpa(q1_sol1)
q1_sol1=round(q1_sol1)
q1_sol2=eval(q1_sol2)
% Paso 2
p2izq=inv(bAc)*inv(aAb)*noap
p2izq=simplify(p2izq)
p2der=cAd
p2izq==p2der
ec2=p2izq(1,4)==p2der(1,4)
q1=0
q2_sol1=eval(ec2)
q2_sol1=solve(q2_sol1)
q1=-pi
q2_sol2=eval(ec2)
q2_sol2=solve(q2_sol2)
ec3=p2izq(3,4)==p2der(3,4)
q1=0
q2=pi/2
q3_sol1=eval(ec3)
q1=-pi
q2=pi/2
q3_sol2=eval(ec3)
%% Comprobación
Q=[3 pi/2 5/2]
T2=Robot.fkine(Q)
error=T-T2
figure
Robot.plot(Q)

