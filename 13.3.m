clc; clear all;
a=5/8; B=3;
x = [3/8 zeros(1,20)]
ycap=0;
for n=1:21
  ay=abs(a*ycap);
  ay=ay+(1/2)*2^(-B);
  Qy=0;
  for k=1:B
    Qy=fix(ay*2)/(2^k) +Qy;
    ay=(ay*2)-fix(ay*2);
  end
  Qy=sign(a*ycap)*Qy;
  y(n)=Qy+x(n);
  ycap = y(n);
end
k=0:20;
stem(k,y,'filled');
xlabel('Amplitude');
ylabel('Time index n');