fprintf('RED PERCEPTRON\n');
fprintf('Caso 1: Solo para dos dimenciones (Metodo grafico) \n');
fprintf('Caso 2: Para cualquier numero de dimenciones (Regla de aprendizaje) \n');
caso=input('Ingrese el caso que desea aplicar: \n');
compuerta= input('Compuerta (AND = 1) (OR = 2)\n');
itmax=50;
switch caso
    case 1
        %Asignamos valores a los pesos
         w(1)=1/randi([-5 5]);
         w(2)=1/randi([-5 5]);
         display(w);
        %Asignamos valores a el bias
        b=1/randi([-5 5]);
        display(b);

        switch compuerta
            case 1
                %Creamos el target con la solicion
                ne=2;
                    for t=1:(2^ne)
                       if (2^ne) == t
                           vect(t)=1;
                       else 
                           vect(t)=0;
                       end
                       t=t+1;
                    end
                    display(vect);
                %Creamos la matriz de puntos
                    for i=1:(2^ne)
                       entra=de2bi(i-1, ne);
                       puntos(i,1)=entra(1);
                       puntos(i,2)=entra(2);
                       i=i+1;
                    end
                    display(puntos);
                    for i=1:10
                        for j=1:(2^ne)
                            a=hardlim(w * puntos(j,:)' + b);
                            e=vect(j)-a;
                            w= w + e * puntos(j,:);
                            b=b+e;
                            display(w);
                            display(a);
                        end
                    end
                        x=puntos(:,1);
                        y=puntos(:,2);
                        linea(1)=-b/w(1);
                        linea(2)=-b/w(2);
                        plot(x,y,'*')
                        line([linea(1), 0],[0,linea(2)]);   
                
            case 2
                %Creamos el target con la solicion
                ne=2;
                    for t=1:(2^ne)
                       if 1 == t
                           vect(t)=0;
                       else 
                           vect(t)=1;
                       end
                       t=t+1;
                    end
                    display(vect);
                %Creamos la matriz de puntos
                    for i=1:(2^ne)
                       entra=de2bi(i-1, ne);
                       puntos(i,1)=entra(1);
                       puntos(i,2)=entra(2);
                       i=i+1;
                    end
                    display(puntos);
                    for i=1:10
                        for j=1:(2^ne)
                            a=hardlim(w * puntos(j,:)' + b);
                            e=vect(j)-a;
                            w= w + e * puntos(j,:);
                            b=b+e;
                            display(w);
                            display(a);
                        end
                    end
                        x=puntos(:,1);
                        y=puntos(:,2);
                        linea(1)=-b/w(1);
                        linea(2)=-b/w(2);
                        plot(x,y,'*')
                        line([linea(1), 0],[0,linea(2)]);
            otherwise
            fprintf('La compuerta no existe');    
        end 
    case 2
        %Genermos la matriz con n entradas
        ne=input('Ingrese el numero de entradas\n');
        %Cramos los pesos y los bias 
        for k=1:ne
            w(k)=1/randi([-5 5]);
            k=k+1;
        end
        display(w);
        b=1/randi([-5 5]);
        display(b);
        fid=fopen('C:\Users\javis\Documents\MATLAB\Practica4\Pesos.txt','w');
        switch compuerta
            case 1
                  %Generamos el target
                  for t=1:(2^ne)
                       if (2^ne) == t
                           vect(t)=1;
                       else 
                           vect(t)=0;
                       end
                       t=t+1;
                  end
                  for i=1:100
                      for j=1:(2^ne)
                          punto=de2bi(j-1,ne);
                          a=hardlim(w * punto' + b);
                            e=vect(j)-a;
                            w= w + e * punto;
                            fprintf(fid,'%2.2f ',w);
                            b=b+e;
                          j=j+1;
                          fprintf(fid,'\n ');
                      end
                      
                      i=i+1;
                  end
                  fclose(fid);
                  graf=load('Pesos.txt');%Cargamos los datos de pesos escritos en txt
                  plot(graf);%graficacion de los valores de W y b
                  title('Perceptron Network');
                  xlabel('Convergencia')%Asignamos el titulo del eje x
                  ylabel('Tranformación de w')%Asignamos el titulo del eje y
            case 2
                  %Generamos el target
                  for t=1:(2^ne)
                       if 1 == t
                           vect(t)=0;
                       else 
                           vect(t)=1;
                       end
                       t=t+1;
                  end
                  for i=1:100
                      for j=1:(2^ne)
                          punto=de2bi(j-1,ne);
                          a=hardlim(w * punto' + b);
                            e=vect(j)-a;
                            w= w + e * punto;
                            fprintf(fid,'%2.2f ',w);
                            b=b+e;
                          j=j+1;
                          fprintf(fid,'\n ');
                      end
                      
                      i=i+1;
                  end
                  fclose(fid);
                  graf=load('Pesos.txt');%Cargamos los datos de pesos escritos en txt
                  plot(graf);%graficacion de los valores de W y b
                  title('Perceptron Network');
                  xlabel('Convergencia')%Asignamos el titulo del eje x
                  ylabel('Tranformación de w')%Asignamos el titulo del eje y
            otherwise
                fprintf('La compuerta no existe\n');
        end
        
    otherwise
        fprintf('No esxiste el caso');
end 
