function  cphi1=cphi(y,T,p)
jam1=0;
sigma=zeros(length(y));
phisat=zeros(1,length(y));
phihat=zeros(1,length(y));R=83.14;
load bv.dat
B=bv;
for i=1:length(y)
    for j=1:length(y)
        sigma(i,j)=2*B(i,j)-B(i,i)-B(j,j);
    end
end
for i=1:length(y)
    for j=1:length(y)
        for k=1:length(y)
            jam2=y(j)*y(k)*(2*sigma(j,i)-sigma(j,k));
            jam1=jam1+jam2;
        end
    end
    phihat(i)=exp((p/(R*T))*((B(i,i)+0.5*jam1)));
    phisat(i)=exp(p/R/T*B(i,i));
    jam1=0;
end
    cphi1=phihat./phisat;
end
