%Frank Antolino
%Dr. Leeds
%File: evaluateMAP.m

function [output] = evaluateMAP(testData,fParams,nParams,tParams,Prior)

   numCorrect = 0;
   numTotal = 0;
   test = char(struct2cell(testData));

   for i = 1:length(test)

     x = classifyNeedPosterior(test(i,2),fParams,nParams,tParams,Prior);

    %Compare the predicted action,[x], to the actual action, [test(i,1)]
    %and keep track of total matches.
     if x == test(i,1)
       numCorrect = numCorrect+1;
     end
     numTotal = numTotal+1;
  end

output = (numCorrect/numTotal);

end

%{
  With 20 used to learn:
    -MLE = .3430
    -MAP = .3761
  With 100 used to learn:
    -MLE = .3761
    -MAP = .3761
  With 500 used to learn:
    -MLE = .4242
    -MAP = .4322
  With 2500 used to learn:
    -MLE = .4242
    -MAP = .4481
---------------------------
%}


