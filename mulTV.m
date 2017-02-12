function M = mulTV( T, v )
%MULTV Multiplies T by v to give a matrix.

M = sym('M', [size(T,1), size(T,2)]);

for i = 1:size(T,1),
    M(i,:) = (permute(T(i,:,:), [3 2 1]) * v)';
end

end

