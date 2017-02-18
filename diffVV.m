function dp = diffVV( p, t )
%DIFFVV Differentiates the column vector p by the vector t.
%   dp(i,j) = d p(i) / d t(j)

dp = sym('dp', [length(p), length(t)]);


for j = 1:length(t),
    dp(:,j) = diff(p, t(j));
end

end

