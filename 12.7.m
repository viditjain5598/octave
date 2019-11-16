clc; clear all; close all;
T=1; Ap=2.5; As=30;
Wp=20; Ws=50;
N, Wc = cheb1ord(Wp, Ws, Ap, As, 's');
b, a = cheby1(N, Ap, Wp, 's');
Hs = tf(b, a)
numd, dend = bilinear(b, a, 1/T);
Hz = tf(numd, dend, T)
wp=2*atan(Wp*T/2)
ws=2*atan(Ws*T/2)
w=0:0.01:pu;
Hw=freqz(numd, dend, w);
