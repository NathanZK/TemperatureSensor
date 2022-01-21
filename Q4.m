Tc=[0:5:125];
Tk= Tc+273.15;

e= 2.71828;
R10 = 1882.5;
T10= 283.15;
beta= 3560.468;

R=R10.*e.^(beta.*((1./Tk)-(1./T10)));

R0= R10.*e.^(beta.*((1./273.15)-(1./T10)));
R125= R10.*e.^(beta.*((1./(125+273.15))-(1./T10)));
Rhalf = R10.*e.^(beta.*((1./(125/2+273.15))-(1./T10)));

Vhalf = 2.5;
Vmax = 5;
RImin = R0;

r =  linspace (0, 0.5, 100);
%plot(Tk,R);
hold on

%syms Vs r
%eqn1 = Vs* ( 1/ (1+ r*(RImin/Rhalf)) - 1/ (1+ r)) == 2.5;
%eqn2 = Vs* ( 1/ (1+ r*(RImin/R125)) - 1/ (1+ r)) == 5;

eqn1 = Vs ==  ((1./ (1+ r*(RImin./Rhalf)) - 1./ (1+ r)).^-1)*Vhalf;
eqn2 = Vs ==  ((1./ (1+ r*(RImin./R125)) - 1./ (1+ r)).^-1)*Vmax;
%[rSol,VsSol] = solve(eqn1, eqn2);



VS1 =  ((1./ (1+ r*(RImin./Rhalf)) - 1./ (1+ r)).^-1)*Vhalf;
VS2 =  ((1./ (1+ r*(RImin./R125)) - 1./ (1+ r)).^-1)*Vmax;

plot(r,VS1, 'r' , r,VS2, 'b');
%Intersection of V1 and V2 gives r
hold on
rValue = 0.06565
VsValue = -6.79711
plot (rValue, VsValue, 'g o');

title('Plot of VS1, VS2 and their intersection')
legend({'VS1','VS2'},'Location','southeast')

%Letting R2=5K

R2= 5e3
R3 = rValue *R2
R4 = rValue *RImin


