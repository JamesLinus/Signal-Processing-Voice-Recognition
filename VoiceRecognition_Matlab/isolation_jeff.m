

function words = isolation_jeff(samples)
words = {};

figure
plot(samples);
hold on;



rectified = abs(samples);

ave_length = ones(2000,1);
moving_average = conv(rectified,ave_length);

state = 0;
amp_threshold = 6.5;
dur_threshold = 12000;
start = 0;

for idx = 1:numel(moving_average)
    sample = moving_average(idx);
    if state == 0
        if sample > amp_threshold
            state = 1;
            start = idx;
        end
    else
        if sample < amp_threshold
            state = 0;
            dur = idx-start+1;
            if dur > dur_threshold
                plot([start,start],[-1,1],'red')
                plot([idx,idx],[-1,1],'red')
                words = [words, samples(start:idx)];
            end
        end
    end
end


        
        