function [t1,t2,t3,d_new] = move_board(move, towers, d_new)
    t1 = towers(:,1);
    t2 = towers(:,2);
    t3 = towers(:,3);
    
    if ((sum(move == [0 0 0]) == 3 || sum(move == [1 1 0]) == 3)) && (sum(t1) ~= 0) && (legal_move(t1,t2))
        t2 = circshift(t2,1);
        t2(1) = t1(1);
        d_new = t1(1);
        t1 = circshift(t1,-1); 
        t1(end) = 0;

    elseif ((sum(move == [0 0 1]) == 3 || sum(move == [1 1 1]) == 3) && sum(t1) ~= 0) && (legal_move(t1,t3))
        t3 = circshift(t3,1);
        t3(1) = t1(1);
        d_new = t1(1);
        t1 = circshift(t1,-1); 
        t1(end) = 0;

    elseif (sum(move == [0 1 0]) == 3) && (sum(t2) ~= 0) && (legal_move(t2,t1))
        t1 = circshift(t1,1);
        t1(1) = t2(1);
        d_new = t2(1);
        t2 = circshift(t2,-1); 
        t2(end) = 0;

    elseif (sum(move == [0 1 1]) == 3) && (sum(t2) ~= 0) && (legal_move(t2,t3))
        t3 = circshift(t3,1);
        t3(1) = t2(1);
        d_new = t2(1);
        t2 = circshift(t2,-1); 
        t2(end) = 0;

    elseif (sum(move == [1 0 0]) == 3) && (sum(t3) ~= 0) && (legal_move(t3,t1))
        t1 = circshift(t1,1);
        t1(1) = t3(1);
        d_new = t3(1);
        t3 = circshift(t3,-1); 
        t3(end) = 0;

    elseif (sum(move == [1 0 1]) == 3) && (sum(t3) ~= 0) && (legal_move(t3,t2))
        t2 = circshift(t2,1);
        t2(1) = t3(1);
        d_new = t3(1);
        t3 = circshift(t3,-1); 
        t3(end) = 0;    
    end
end