%% Enero 25 3D transformations.
r=rotx(15,'deg')*rotz(12,'deg')
t=[2,7,5]
A=SE3(r,t)
angulos=tr2rpy(A,'deg')
angulos1=tr2eul(A,'deg')
A1=rpy2tr(angulos,'deg')
A2=eul2tr(angulos1,'deg')
%% 
W=SE3()
r=rotx(15,'deg')
t=[0.6,-0.2,-0.2]
wTc=SE3(r,t)
r=rotz(15,'deg')
t=[0,0,0.8]
wTi=SE3(r,t)
wP=[0.45,-0.4,-0.45]' 
%% Calcular punto
cP=inv(wTc)*wP
iP=inv(wTi)*wP
figure
trplot(W)
grid on
hold on
trplot(wTc)
trplot(wTi)
plot_point3(wP, 'Marker', 'o', 'Label', 'wP', 'Color', 'g');