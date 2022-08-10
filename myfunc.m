function a=myfunc(x)


str=input('Enter function: ','s');    %함수를 입력 받음
k = eval(['@(x) ' str]);    %문자열을 익명함수로 정의
a=k(x);    

end