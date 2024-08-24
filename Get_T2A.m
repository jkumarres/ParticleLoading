function A = Get_T2A( A )

    A.T2A = zeros( A.nT , 1 );

    for iT = 1 : A.nT
        for iV = 1 : 3
    
            i = iV;
            j = iV-1;
            k = iV+1;
    
            if(j==0)
                j = 3;
            end
    
            if(k==4)
                k = 1;
            end
    
            i = A.T2V(iT,i);
            j = A.T2V(iT,j);
            k = A.T2V(iT,k);
    
            Xij = A.V2X(j,:) - A.V2X(i,:);
            Xik = A.V2X(k,:) - A.V2X(i,:);
    
            A.T2A(iT) = abs( sqrt( (Xij(2)*Xik(3)-Xij(3)*Xik(2))^2 ...
                             + (Xij(1)*Xik(3)-Xij(3)*Xik(1))^2 ...
                             + (Xij(1)*Xik(2)-Xij(2)*Xik(1))^2 ) ) / 2;
        end
    end

    return;
end