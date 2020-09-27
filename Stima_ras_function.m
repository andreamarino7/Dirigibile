function Stima_ras_function(Q,A,Rmax,Rmin,fsys,hFig)

if any(eig(Q)<=0)
    error('Q deve essere definita positiva');
end
if any(eig(A)>=0)
    error('A deve avere solo autovalori negativi');
end

N_STEPS=1e3; %Numero di punti sulla curva di livello
P=lyap(A',Q);

M=inv(sqrtm(P));
figure(hFig);
hold on;
grid on;

while (Rmax-Rmin>0.0001)
    R=Rmin+(Rmax-Rmin)/2;
    z_p=[];
    for i=1:1:N_STEPS
        x=rand(size(A,1),1)-0.5;
        y=sqrt(R)*x/norm(x);
        z=M*y;
        z_p=[z_p z];
        vdot=-z'*Q*z+2*z'*P*fsys(z);
        if vdot>=0
            break;
        end
    end
    if vdot<0
        Rmin=R;
        plot3(z_p(1,:),z_p(2,:),z_p(3,:),'o');
        xlabel('Temperatura');
        ylabel('Quota');
        zlabel('Velocità');
        drawnow;
    else
        Rmax=R;
    end

end
end