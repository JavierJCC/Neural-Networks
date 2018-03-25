
gate=input('Compuerta AND = 3 OR = 2 NOT = 1 (Nota: la compuerta not solo puede tener una entrada)\n')

ne=input('Ingrese el numero de entradas: \n')

%generamos el vector de salida o target

if gate == 3
    for t=1:(2^ne)
       if (2^ne) == t
           vect(t)=1;
       else 
           vect(t)=0;
       end
       t=t+1;
    end
    disp(vect);
elseif gate == 2    
    for t=1:(2^ne)
       if 1 == t
           vect(t)=0;
       else 
           vect(t)=1;
       end
       t=t+1;
    end
    disp(vect);
elseif gate==1
    vect(1)=1;
    vect(2)=0;
    disp(vect);
end

if gate == 3
    bd=0;
    for i=0:100
       ub=randi([-20 20]);
       fprintf('theta es igual a %d\n',ub);
       w=randi([-10 10]);
       fprintf('w es igual a %d\n',w);
       for j=0:(2^ne)-1
           b=de2bi(j , ne);
           x=linspace(w,w,ne);
           n=x*b';
           fprintf('%d\n',n)
           if(n > ub) && (vect(j+1) == 1)
               fprintf('v %d\n',vect(j+1));
               bd=bd+1;
           elseif (n <= ub) && (vect(j+1) == 0)
               bd=bd+1;
               fprintf('v %d\n',vect(j+1));
           end
         j=j+1;  
       end 
       if(bd == (2^ne))
           fprintf('Hubo aprendizaje\n');
           bd=0;
       else fprintf('No hubo aprendizaje\n');
           bd=0;
       end
       i=i+1;
    end
elseif gate == 2
    bd=0;
     for i=0:100
       ub=randi([-20 20]);
       fprintf('theta es igual a %d\n',ub);
       w=randi([-10 10]);
       fprintf('w es igual a %d\n',w);
       for j=0:(2^ne)-1
           b=de2bi(j , ne);
           x=linspace(w,w,ne);
           n=x*b';
           fprintf('%d\n',n)
           if(n > ub) && (vect(j+1) == 1)
               fprintf('v %d\n',vect(j+1));
               bd=bd+1;
           elseif (n <= ub) && (vect(j+1) == 0)
               fprintf('v %d\n',vect(j+1));
               bd=bd+1;
           end
         j=j+1;  
       end 
       if(bd == (2^ne))
           fprintf('Hubo aprendizaje\n');
           bd=0;
       else fprintf('No hubo aprendizaje\n');
           bd=0;
       end
       i=i+1;
    end
elseif gate == 1
    bd=0;
    for i=0:100
       ub=randi([-10 10])
       fprintf('theta es igual a %d\n',ub);
       w=randi([-10 10]);
       fprintf('w es igual a %d\n',w);
       for j=0:(2^ne)-1
           b=de2bi(j , ne);
           x=linspace(w,w,ne);
           n=x*b';
           fprintf('%d\n',n)
           if(n > ub) && (vect(j+1)== 1)
               fprintf('v %d\n',vect(j+1));
               bd=bd+1;
           elseif (n <= ub) && (vect(j+1)==0)
               fprintf('v %d\n',vect(j+1));
               bd=bd+1;
           else 
               break;
           end
         j=j+1;  
       end
       if(j == (2^ne))
           fprintf('Hubo aprendizaje\n');
           bd=0;
       else fprintf('No hubo aprendizaje\n');
           bd=0;
       end
       i=i+1;
    end
else
    fprintf('\nLa entrada no corresponde a ninguna compuerta logica\n');
end 