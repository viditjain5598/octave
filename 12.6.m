clc; clear all; close all;
T=1; wp=0.3*pi; ws=0.8*pi;
Ap=1; As=40;
Wp=(2/T)*tan(wp/2);
Ws=(2/T)*tan(ws/2);
R=(10^(01.*Ap)-1)/(10^(01.*As)-1);
N=ceil((1/2)*(log10(R)/log10(Wp/Ws)));
Wc=Wp/((10^(0.1*Ap)-1)^(1/(2*N)));
b, a = butter(N, Wc, 'low', 's');
Hs=tf(b,a)
numd, dend=bilinear(b,a,1/T);
Hz=tf(b, a, T);
w=0:0.01:pi;
Hw=freqz(numd, dend,w);
