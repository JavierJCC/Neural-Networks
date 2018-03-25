nv = input('Ingrese el primer vector \n')
disp(' ')
nv2 = input('Ingrese el segundo vector \n')
disp(' ')
n=length(nv2);
for i=1:n
    if nv2(i) == 1
        fprintf('a%d=purelim( wp+b )\n',i);
        fprintf('%dx1= purelim( %dx%d %dx1 + %dx1)\n',nv(i+1),nv(i+1),nv(i),nv(i),nv(i+1));
    elseif nv2(i) == 2
        fprintf('a%d= logsig( wp+b )\n',i);
        fprintf('%dx1= logsig( %dx%d %dx1 + %dx1)\n',nv(i+1),nv(i+1),nv(i),nv(i),nv(i+1));
    elseif nv2(i) == 3
        fprintf('a%d= tansig( wp+b )\n' ,i);
        fprintf('%dx1= tansig( %dx%d %dx1 + %dx1)\n',nv(i+1),nv(i+1),nv(i),nv(i),nv(i+1));
    end 
    i=i+1; 
end    