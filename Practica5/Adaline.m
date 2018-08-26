fprintf('Instituto Politécnico Nacional\n');
fprintf('Seleccione la compuerta\n');
fprintf('Caso 1: Compuerta AND\n');
fprintf('Caso 2: Compuerta OR\n');
fprintf('Caso 3: Archivo\n');
caso=input('Opcion: \n');

%Generamos el dataset
switch caso
    case 1
        ne=input('Ingrese el numero de entradas(entradas >= 2): ');
           for t=1:(2^ne)
                if (2^ne) == t
                   vect(t)=1;
                else 
                   vect(t)=0;
                end
                   t=t+1;
           end
           display(vect);
           for t=1:(2^ne)
               entrada=de2bi(t-1,ne);
               entrada2(t,:)=entrada;
               t=t+1;
           end
           display(entrada2);
    case 2
        ne=input('Ingrese el numero de entradas(entradas >= 2):');
            for t=1:(2^ne)
                if 1 == t
                    vect(t)=0;
                else 
                    vect(t)=1;
                end
            end
            display(vect);
            for t=1:(2^ne)
                entrada=de2bi(t-1,ne);
                entrada2(t,:)=entrada;
                t=t+1;
            end
            display(entrada2);
    case 3
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
    otherwise
        fprintf('Opcion no valida');
end

%Calculamos las red adaline
alfa=input('Ingresa el valor de alfa: \n');
itmax=input('Ingresa el numero de iteraciones maxima\n');
fprintf('La matiz de pesos se generara aleatoriamente a si como el bias\n');
[x,y]=size(entrada2);
display(x);
display(y);

%Generamos los pesos 
    num=randi([0,(2^ne)]);
    wi=de2bi(num,y);

%Generamos los bias 
    bi=randi([0,1]);
    display(wi);
    display(bi);
%Realizamos las epocas 
et=0;
fid2=fopen('C:\Users\javis\Documents\MATLAB\Practica5\Pesos.txt','w');
fprintf(fid2,'%2.2f ',wi);
fprintf(fid2,'\n ');
for i=0:itmax
    %Entramos a las epocas
    for j=1:(2^ne)
        a1=purelin(wi*entrada2(j,:)' + bi');
        display(a1);
        e=vect(j)-a1;
        display(e);
        et=et+abs(e);
        w1=wi+2*alfa*e*entrada2(j,:);
        fprintf(fid2,'%2.2f ',w1);
        fprintf(fid2,'\n ');
        display(w1);
        b1=bi'+2*alfa*e;
        display(b1);
        
        wi=w1;
        bi=b1;
        j=j+1;
    end
    if et<=alfa
        fprintf('Et es menor a alfa\n');
        break;
    end
end
fclose(fid2);
%Ahora graficamos 
graf=load('Pesos.txt');%Cargamos los datos de pesos escritos en txt
f1 = figure;%Funcion para abir una ventana para graficar
plot(graf);%graficacion de los valores de W y b
title('Adaline Network');
    
    
