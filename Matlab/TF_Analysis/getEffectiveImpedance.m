function [k_eff,b_eff,m_eff,j_eff] = getEffectiveImpedance(Fv,Angles,TF)

    k_eff = zeros(length(Fv),1);
    b_eff = zeros(length(Fv),1);
    m_eff = zeros(length(Fv),1);
    j_eff = zeros(length(Fv),1);
    
    for i = 1:length(Fv)
    
        if(-2*pi <= Angles(i) && Angles(i) <= 0)
            k_eff(i) = 2*pi*Fv(i)*imag(TF(i));
        end
    
        if(-pi/2 < Angles(i) && Angles(i) < pi/2)
            b_eff(i) = real(TF(i));
        end
    
        if(0 < Angles(i) && Angles(i) < pi)
            m_eff(i) = inv(2*pi*Fv(i))*imag(TF(i));
        end

        if(pi/2 < Angles(i) && Angles(i) < 3*pi/2)
            j_eff(i) = -inv((2*pi*Fv(i))^2)*real(TF(i));
        end
    
    end
    

end