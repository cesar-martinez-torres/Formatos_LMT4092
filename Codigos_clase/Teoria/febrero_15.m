%% Robot cilindrico
close all
syms q1 q2 q3 q4
l1=5
l4=2.5
aTb=trotz(q1)*transl(0,0,l1)*transl(0,0,0)*trotx(0)
bTc=trotz(pi/2)*transl(0,0,q2)*transl(0,0,0)*trotx(pi/2)
cTd=trotz(0)*transl(0,0,q3)*transl(0,0,0)*trotx(0)
dTe=trotz(q4)*transl(0,0,l4)*transl(0,0,0)*trotx(0)
% 15
T=aTb*bTc*cTd*dTe
T=simplify(T)
%% Armar el robot
L(1)=Link([0 l1 0 0 0])
L(2)=Link([pi/2 0 0 pi/2 1])
L(3)=Link([0 0 0 0 1])
L(4)=Link([0 l4 0 0 0])
L(2).qlim=[0 5]
L(3).qlim=[0 5]
cilin=SerialLink(L,'name','Cilindrico')
figure
cilin.teach
%%Evaluando "T" para obtener la cinem,atica directa
q1=deg2rad(120)
q2=3.8
q3=3.9
q4=deg2rad(150)
T1=eval(T)
angT1=tr2rpy(T1,'deg')
%% fkine
Q=[q1 q2 q3 q4]
T2=cilin.fkine(Q)
angT2=tr2rpy(T2,'deg')
figure
cilin.plot(Q)

