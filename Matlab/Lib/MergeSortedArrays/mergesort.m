function a = mergesort(a)

n = numel(a);
if n>=2
   split = floor((1+n)/2);
   a1 = mergesort(a(1:split));
   a2 = mergesort(a(split+1:end));
   a = mergemex(a1,a2);
end
