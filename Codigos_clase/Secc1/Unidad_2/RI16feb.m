%% RI S1 16 feb
close all
clear
l1=5;
l2=5;
l3=3;
A(1)= Link([0 l1 0 -pi/2 0]); %Generar cada una de las articulaciones 
A(2)= Link([0 0 l2 pi/2 0]);%th,d,a,alpha, tipo art; 0=rot 1=pris
A(3)= Link([0 0 0 0 1]);
A(3).qlim = [3 6];
Robot1= SerialLink(A, 'name', 'RRP'); %Unir articulaciones
W=SE3()
%figure
%Robot1.plot([pi/2 0 4],'workspace', [-10 10 -10 10 -10 10]) %Plotear robot
figure
Robot1.teach
syms q1 q2 q3
c1=[q1 q2 q3]
cin_dir=Robot1.fkine(c1)
O=tr2rpy(cin_dir,'deg')
