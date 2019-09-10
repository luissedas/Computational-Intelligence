% Translation from chromosome to puzzle moves
function  translation(N, individual)

t1 = 1:N;                    % Tower 1
t2 = zeros(1,length(t1));    % Tower 2
t3 = zeros(1,length(t1));    % Tower 3
towers = [t1',t2',t3'];
d_old = 8346;                % Disk moved previos turn
d_new = 8374;                % Disk moved in present turn
j = 1;
tmpFit = -999;

for i =0:length(individual)/3-1
    move = individual(3*i+1:3*i+3); % 3 bit string

    [t1,t2,t3,d_new] = move_board(move, towers, d_new);
    
    if (d_old ~= d_new) && (sum([t1(1), t2(1), t3(1)] == towers(1,:)) ~= 3) && (tmpFit~=sum(1:N)) 

        if ((sum(move == [0 0 0]) == 3 || sum(move == [1 1 0]) == 3)) && (sum(towers(:,1)) ~= 0) 
            disp(['move: ',num2str(j),',',' 1->2'])
        elseif ((sum(move == [0 0 1]) == 3 || sum(move == [1 1 1]) == 3) && sum(towers(:,1)) ~= 0) 
            disp(['move: ',num2str(j),',',' 1->3'])
        elseif (sum(move == [0 1 0]) == 3) && (sum(towers(:,2)) ~= 0) 
            disp(['move: ',num2str(j),',',' 2->1'])
        elseif (sum(move == [0 1 1]) == 3) && (sum(towers(:,2)) ~= 0)
            disp(['move: ',num2str(j),',',' 2->3'])
        elseif (sum(move == [1 0 0]) == 3) && (sum(towers(:,3)) ~= 0) 
            disp(['move: ',num2str(j),',',' 3->1'])
        elseif (sum(move == [1 0 1]) == 3) && (sum(towers(:,3)) ~= 0) 
            disp(['move: ',num2str(j),',',' 3->2'])
        end
        d_old = d_new;
        towers = [t1,t2,t3];
        display([t1,t2,t3]);
        j = j + 1;
        disp('----------------------')
    end
    tmpFit = sum(t3);
end
end