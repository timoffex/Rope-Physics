function dp = diffVV( p, t )
%DIFFVV Differentiates the vector p by the vector t.
%   dp(i,j) = d p(i) / d t(j)

dp = sym('dp', [length(p), length(t)]);

for i = 1:length(p),
    for j = 1:length(t),
        dp(i,j) = diff(p(i), t(j));
    end
end

end

