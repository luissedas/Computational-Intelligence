function [set1,set2] = translation(individual, set)
    t1 = set.*individual;
    t2 = set.*not(individual);
    set1 = t1(t1~=0);
    set2 = t2(t2~=0);
end