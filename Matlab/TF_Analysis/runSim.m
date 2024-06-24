clear
params; 
freqs = logspace(-1,3,500);
syms s;

ii = 1;
iii = 1;

for T = [0,2,4,6,8]/1000
    for m_err = [0.96,0.98,1,1.02,1.04]
    
        m_hat = m_err*m;
        b_hat = m_err*b;
        sys{1} = (md*s^2 + bd*s + kd)/s; %Base system
        sys{2} = (m*s^2 + (b-b_hat+bd*m_hat/md)*s + kd*m_hat/md)/(s*(1+exp(-s*T)*(-1+(m_hat/md)))); %IC
        sys{3} = ((md*s^2+bd*s+kd)*(m*s^2+(b+kv)*s+kp))/(s*(md*s^2 + bd*s + kd + exp(-s*T)*(kv*s + kp))); %AC PD
        sys{4} = ((md*s^2+bd*s+kd)*(m*s^2+(b-b_hat+kv*m_hat)*s+kp*m_hat))/(s*((md*s^2 + bd*s + kd)*(1-exp(-s*T)) + m_hat*exp(-s*T)*(s^2 + kv*s + kp))); %AC CT
        %sys{5} = (md*s^2*(m*s^2 + (b-b_hat + m_hat*kv)*s + m_hat*kp)+m_hat*(bd*s+kd)*(s^2+kv*s+kp))/(s*(md*s^2*(1-exp(-s*T))+m_hat*(s^2+kv*s+kp)*exp(-s*T))); %IMIC

        for i = 1:4
            k = 1;
            for j = freqs
        
                val = subs(sys{i},j*sqrt(-1));
                tf{iii}{ii}{i}(k) = double(val);
                mag{iii}{ii}{i}(k) = 20*log10(abs(double(val)));
                phase{iii}{ii}{i}(k) = angle(double(val));
        
                if(j > 5 && phase{iii}{ii}{i}(k) < 0)
                    while(phase{iii}{ii}{i}(k)<0)
                        phase{iii}{ii}{i}(k) = phase{iii}{ii}{i}(k) + 2*pi;
                    end
                end
        
                k = k + 1;
        
            end
            
            phase{iii}{ii}{i} = unwrap(phase{iii}{ii}{i});
            [k_eff,b_eff,m_eff,j_eff] = getEffectiveImpedance(freqs/(2*pi),phase{iii}{ii}{i},tf{iii}{ii}{i});
        
            ke{iii}{ii}{i} = k_eff;
            be{iii}{ii}{i} = b_eff;
            me{iii}{ii}{i} = m_eff;
            je{iii}{ii}{i} = j_eff;
    
            
        
        end
           
        ii = ii + 1;
    end
    ii = 1;
    iii = iii + 1;
end
