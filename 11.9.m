clc; clear all; close all;
Fp=2000; Fs=5000;
Ap=2; As=42;
Ft=20000;
wp=(2*pi)*(Fp/Ft);
ws=(2*pi)*(Fs/Ft);
trwidth=ws-wp;
M=21; tau=(M-1)/2;
n=0:M-1;
hd=((cos(pi*(n-tau)))./((n-tau))) - (sin(pi*(n-tau)))./(pi*(n-tau)*2);
hd(tau+1)=0;
whamm=hamming(M);
h=hd.*whamm;
w=0:0.01:pi;
Hw=freqz(h, 1, w);
Hrw=exp(-j*(pi/2-10*w));