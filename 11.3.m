clc; clear all; close all;
M=17; tau=(M-1)/2;
n=0:M-1; wc1=pi/4; wc2=pi/2;
hd=(sin(wc2*(n-tau)))./(pi*(n-tau)) - (sin(wc1*(n-tau)))./(pi*(n-tau));
hd(tau+1)=0.4;
wrect=hanning(M);
h=hd.*wrect;
w=0:0.01:pi;
Hw=freqz(h,1,w);
MagHw=abs(Hw);
HwdB=20*log(MagHw/max(MagHw));
subplot(221); stem(n,hd,'filled');
axis([-1 M -0.15 0.5]);
xlabel('n'); ylabel('hd(n)');
title('Ideal Impulse Response');
subplot(222); stem(n,hd,'filled');
axis([-1 M -0.15 0.5]);
xlabel('n'); ylabel('w(n)');
title('Hamming window');
subplot(223); stem(n,wrect,'filled');
axis([-1 M -0.1 1.2]);
xlabel('n'); ylabel('h(n)');
title('Actual Impulse Response');
subplot(224); plot(w, HwdB);
axis([0 pi -80 10]);
xlabel('freq'); ylabel('dB');
title('Magnitude Response');