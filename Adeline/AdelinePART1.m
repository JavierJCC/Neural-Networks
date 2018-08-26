%puntos
p=[1 1; 1 2; 2 1; 2 0; -1 2; -2 1; -1 -1; -2 -2];

%target
t=[-1 -1; -1 -1; -1 1; -1 1; 1 -1; 1 -1; 1 1; 1 1];

wcero=[1 0;0 1];
bcero=[1; 1];
alfa=0.04;
for j=1:2
for i=1:8
    paux=p(i,:);
    display(paux');
    taux=t(i,:);
    display(taux);
    display(wcero);
    aaux=purelin(wcero * paux' + bcero);
    display(aaux);
    ecero=taux'-aaux;
    display(ecero);
    wuno=wcero + 2*alfa*ecero*paux;
    display(wuno);
    buno=bcero + 2*alfa*ecero;
    display(buno);
    wcero=wuno;
    bcero=buno;
    i=i+1;
end
j=j+1;
end




