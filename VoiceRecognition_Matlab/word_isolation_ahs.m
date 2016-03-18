
%%%%%%%%%%%              WORD ISOLATION          %%%%%%%%

function [starting_points, ending_points] = word_isolation_ahs(user)

starting_counter = 0;
ending_counter = 0;
starting_points = zeros(1, 15);
ending_points = zeros(1, 15);

moving_average = zeros(1, 400);
% We only identify a word as positive (word) or negative (noise)
% IF for 18 sets of moving average
% (18 * 200 = 3600 samples) the average is above or below 4.
positive_counter = 0;
negative_counter = 0;


% i will be incremented by 200 during each iteration.
% moving_average is size 400!
% Half of the samples will be re-analyzed each iteration,
% hence being called moving average.
i = 1;

while(i < length(user) - 400)
    moving_average = sum(abs(user(i:i+399)));
    if(moving_average > 4 && starting_counter <= ending_counter)
        positive_counter = positive_counter + 1;
        if(positive_counter == 18)
            starting_counter = starting_counter + 1;
            starting_points(starting_counter) = i - 18*200;
            positive_counter = 0;
        end
    end
    if(moving_average < 4 && starting_counter > ending_counter)
        negative_counter = negative_counter + 1;
        if(negative_counter == 18)
            ending_counter = ending_counter + 1;
            ending_points(ending_counter) = i - 9*200;
            negative_counter = 0;
        end
        
    end
    i = i + 200;
end

% figure();
% plot(user);
% % xlim([starting_points(1), ending_points(5)])
% hold on;
% y = [-1, 1];
% for i = 1:length(starting_points)
%     plot([starting_points(i), starting_points(i)], y, 'g--');
%     plot([ending_points(i), ending_points(i)], y, 'r--');
% end
% hold off;