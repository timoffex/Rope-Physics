function dM = diffMV( M, t )
%DIFFMV Differentiates M by t such that d(M * q) = dM * q.

dM = sym('dM', [size(M,1), length(t), size(M,2)]);


% d(M * q) = [ d(M(i,:) * q) ]
%       = [ d(M(i,:)')' * q ]   let V(i) = M(i,:)' and let M be size AxB
%       = [ d(V(i))' * q ]
%       = [ ( [ d(V(i,1)) ; d(V(i,2)) ; ... ; d(V(i,B)) ] )' * q ]
%       = dM * q
%   dM(i,:,:) = d(V(i))'
%   dM * q = [ (dM(i,:,:) * q)' ]

for i = 1:size(M,1),
    dM(i,:,:) = diffVV(M(i,:)', t)';
end

end

