function output = callWithUnwrapped( func, vector )
%CALLWITHUNWRAPPED Calls the function by unwrapping the given vector into a
%comma separated list and passing it as the argument.

arg = num2cell(vector);
output = func(arg{:});

end

