%Red Hamming
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
vect=input('Ingrese el vector a clasificar \n');
disp(' ')
itmax=100;
[r,c]=size(ce);
%Creamos el bias por default
b=linspace(c,c,r);
display(b);
%calculamos a'
a1=ce*vect' + b';
display(a1)
%calculamos a epsilon
Ep = 1/(r-1);
Aux=Ep/4;
Ep=Ep-Aux;
display(Ep)
%Hacemos el calculo 
for i=1:c
    for j=1:r
        if(i==j)
            Mepcilon(i,j)=1;
        else
            Mepcilon(i,j)=-Ep;  
        end
        j=j+1;
    end
    i=i+1;
end
display(Mepcilon)
%Hacemos el calculo de a2
fid2=fopen('C:\Users\javis\Documents\MATLAB\Practica3\Salidas.txt','w');
%Iteramos y guardamos en el archivo
%realizamos la primera iteración 
aux1=linspace(0,0,c);
aux2=aux1';
display(aux2);
for z=1:itmax
    a2=Mepcilon*a1;
    [d]=size(a2);
        for k=1:d
            if(a2(k)<=0)
                fprintf(fid2,'%2.2f ',0);
                a2(k)=0;
            else
                fprintf(fid2,'%2.2f ',a2(k));
            end
            k=k+1;
        end
        fprintf(fid2,'\n ');
        display(a2);
        if(aux2 == a2)
            break;
        end
        aux2=a2;
        a1=a2;
    z=z+1;
end
fclose(fid2);
%Ahora graficamos 
graf=load('Salidas.txt');%Cargamos los datos de pesos escritos en txt
f1 = figure;%Funcion para abir una ventana para graficar
plot(graf);%graficacion de los valores de W y b
title('Hamming Network');
xlabel('Convergencia')%Asignamos el titulo del eje x
ylabel('Tranformación de a2')%Asignamos el titulo del eje y