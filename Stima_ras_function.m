function [R_print,buffer]=Stima_ras_function(Q,A,Rmax,Rmin,fsys,hFig)

if any(eig(Q)<=0)
    error('Q deve essere definita positiva');
end
if any(eig(A)>=0)
    error('A deve avere solo autovalori negativi');
end

N_STEPS=1e3; %Numero di passi per aumentare il raggio
P=lyap(A',Q);

M=inv(sqrtm(P));
figure(hFig);
hold on;
grid on;

R_print=0;

while (Rmax-Rmin>0.0001)
    R=Rmin+(Rmax-Rmin)/2;
    buffer_tmp=[];
    for i=1:1:N_STEPS
        x=rand(size(A,1),1)-0.5;
        y=sqrt(R)*x/norm(x);
        z=M*y;
        buffer_tmp=[buffer_tmp z];
        vdot=-z'*Q*z+2*z'*P*fsys(z);
        if vdot>=0
            break;
        end
    end
    if vdot<0               %Non entra in questi cicli
        Rmin=R;
        buffer=buffer_tmp;
        if size(A,1)==2
            plot(buffer_tmp(1,:),buffer_tmp(2,:),'o');
            drawnow;
        elseif size(A,1)>=3
            plot3(buffer_tmp(1,:),buffer_tmp(2,:),buffer_tmp(3,:),'o');
            xlabel('Temperatura');
            ylabel('Quota');
            zlabel('Velocità');
            drawnow;
        end
        if (R_print<R)
            R_print=R;
        end
    else
        Rmax=R;
    end

end
end