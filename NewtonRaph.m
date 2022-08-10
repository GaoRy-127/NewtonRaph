clear; clc; close all;

syms x
y(x)=myfunc(x)
py(x)=primemyfunc(y)

es=input('Enter es: ');     %수렴 조건을 위한 오차범위 설정
maxi=input('Enter maximum iteration(default is 10^5): ');  %최대 반복횟수 설정
i=input('Enter x0: ','s');     %초기값 입력

if isempty(maxi)       %반복횟수 default 설정
    maxi = 100000;
end
a=y(i);               %반복문을 위한 변수 정의
b=py(i);
ea=1;
ea1=1;
cond=0;
temp=[cond double(i) double(a) double(b)];

while(1)
    i1=i-a/b;
    ea1=abs((i1-i)/i1);
    i=i1;
    a=y(i);
    b=py(i);    
    cond=cond+1;
    temp=[temp;cond double(i) double(a) double(b)];
    

    if ea1<es                  %최초 설정한 수렴 조건에 알맞은지 확인
        fprintf('ans Xr is %f \n',i)
        break
    elseif ea1>ea              %발산(오차가 커지는지) 확인
        disp('choose other x0');
        break
    elseif cond>=maxi                 %최대 반복횟수가 넘으면 정지 
        fprintf('iterations over, X%d is %f \n',cond,i)
        break      %최대 반복 횟수 n에서의 값: Xn 출력
    end
    ea=ea1;    
end

     




