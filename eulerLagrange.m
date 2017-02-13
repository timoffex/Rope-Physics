function S = eulerLagrange( L, t, x, x_dot, x_dot_dot )
%LAGRANGIAN Returns Lx - Dt(Lv) of the system, where Lc is the cth partial
%derivative of the system, and Dt is the time derivative symbol.
%   t is the time symbol
%   x contains the 0th-order derivative symbols
%   x_dot contains the 1st-order derivative symbols
%   x_dot_dot contains the 2nd-order derivative symbols
    syms zz1(t) zz2(t)
    
    S = sym(zeros(numel(x), 1));
    for i = 1:numel(x)
        Lx = diff(L, x(i));
        Lv = diff(L, x_dot(i));
        
        Lvt = subs(Lv, [x(i) x_dot(i)], [zz1(t) zz2(t)]);
        Lvtdt = diff(Lvt, t);
        Lvdt = subs(Lvtdt, [zz1(t) zz2(t) diff(zz1(t), t) diff(zz2(t), t)], [x(i) x_dot(i) x_dot(i) x_dot_dot(i)]);
    
        S(i) = Lx - Lvdt;
    end
    
    
    clear zz1(t) zz2(t)

end

