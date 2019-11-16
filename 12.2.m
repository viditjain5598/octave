clc; clear all; close all;
T=1; Wp=2; Ws=4;
e=sqrt(1/0.707^2-1); A=1/0.1;
N=ceil((0.5)*(log10(e^2/(A^2-1)))/(log10(Wp/Ws)));
Wc=Wp/((e^2)^(1/(2*N)));
b, a = butter(N, Wc, 'low', 's');
Hs=tf(b,a)
numd, dend=bilinear(b,a,1/T);
Hz=tf(b, a, T);
wp=2*atan(wp*T/2);
ws=2*atan(ws*T/2);
w=0:0.01:pi;
Hw=freqz(numd, dend,w);
plot(w, abs(hw));