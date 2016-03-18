function error = error_testing(distance,answer)
    

    [x,y] = size(distance);

    correct = 0;
    for i=1:x
        selectedUser = 0;
        best_distance = 999;
        for j=1:y
            if distance(i,j) < best_distance
                best_distance = distance(i,j);
                selectedUser = j;
            end;
        end;
        if selectedUser == answer
            correct= 1 + correct;
        end;
   end;
    error = correct/length(distance);
end
