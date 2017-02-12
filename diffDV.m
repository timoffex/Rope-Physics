function dx = diffDV( x, t )
%DIFFDV x is a scalar and t is a vector. Returns a row vector representing
%the derivative of this scalar by the vector.

dx = diffVV([x], t)';


end

