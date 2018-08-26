%Red Adaline
clear all   %limpiamos los datos que pueda estar resguardando matlab
fprintf('Ingrese el archivo con lo vectores prototipo\n');
[archivo,ruta]=uigetfile('*.txt','ABRIR ARCHIVO');
if archivo==0
    return;
else
fid =fopen([ruta archivo],'r');
ce = load(strcat(ruta,archivo));
fclose(fid);
display(ce)
end
fprintf('Ingrese el target\n');
[archivo,ruta]=uigetfile('*.txt','ABRIR ARCHIVO');
if archivo==0
    return;
else
fid2 =fopen([ruta archivo],'r');
ce2 = load(strcat(ruta,archivo));
fclose(fid2);
display(ce2)
end
[x,y]=size(ce);
display(x);
display(y);
 
wcero=input('Ingrese la matriz de pesos \n');
bcero=input('Ingrese el valor del bias \n');
alfa=input('Ingresa el valor de alfa \n');
itmax=input('Ingresa el numero de iteraciones maxima \n');
emin=input('Ingresa el error\n');
fid3=fopen('C:\Users\javis\Documents\MATLAB\Adaline2\Salidas.txt','w');
fprintf(fid3,'%2.2f ',wcero);
fprintf(fid3,'\n ');
%creamos la variable que sume los errores
et=0
%Calculamos 
for j=1:itmax
    for i=1:x
        paux=ce(i,:);
        display(paux');
        taux=ce2(i,:);
        display(taux);
        display(wcero);
        aaux=purelin(wcero * paux' + bcero);
        display(aaux);
        ecero=taux'-aaux;
        et=et+abs(ecero);
        display(ecero);
        wuno=wcero + 2*alfa*ecero*paux;
        display(wuno);
        buno=bcero + 2*alfa*ecero;
        display(buno);
        wcero=wuno;
        bcero=buno;
        i=i+1;
    end
    fprintf(fid3,'%2.2f ',wcero);
    fprintf(fid3,'\n ');
    if et<emin
        fprintf('El error es menor\n');
        break;
    else
        et=0;
    end
j=j+1;
end
 
%En caso que la dimención de sea de dos
if y == 2
        x1=ce(:,1);
        y1=ce(:,2);
        linea(1)= -bcero(1,1) / wcero(1,1);
        linea(2)= -bcero(1,1) / wcero(1,2);
        linea(3)= -bcero(2,1) / wcero(2,1);
        linea(4)= -bcero(2,1) / wcero(2,2);
        plot([-5, 5], [0, 0],'b',[0, 0], [-5, 5],'b', x1,y1,'*');
        line([linea(1), 0],[0,linea(2)]);
        line([linea(3), 0],[0,linea(4)]);
        grid on
else
%Ahora graficamos
graf=load('Salidas.txt');%Cargamos los datos de pesos escritos en txt
f1 = figure;%Funcion para abir una ventana para graficar
plot(graf);%graficacion de los valores de W y b
title('Adeline Network');
xlabel('Convergencia')%Asignamos el titulo del eje x
ylabel('Tranformación de los pesos')%Asignamos el titulo del eje y  
end
