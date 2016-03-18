%%% ISOLATION OF A SOUND SAMPLE %%%

function StartEndPoints = isolation(user)

    %figure
    %plot(user);
    %hold on;

    %Iteration variables
    i = 1;
    state = 0;
    shift = 0;
    
    %Solution set
    NumberOfSamples = 30;
    StartEndPoints = ones(NumberOfSamples,2);
    
    
    %Isolation parameters
    RectifiedSignal = abs(user);
    Threshold = 6.5;
    WindowSize = 400;
    X = ones(WindowSize,1);
    
    while i  < NumberOfSamples
        avg = mean2(conv(RectifiedSignal(1+shift:WindowSize+shift),X));
        if( avg > Threshold && state == 0)
            StartEndPoints(i,1) = shift;
            state = 1;
            %plot([shift,shift],[-1,1],'red')
        end;
        if( avg < .5 && state == 1)
            StartEndPoints(i,2) = shift;
            state = 0;
            i = i + 1;
            %plot([shift,shift],[-1,1],'red')
         end;
        shift = shift + WindowSize;
    end;



