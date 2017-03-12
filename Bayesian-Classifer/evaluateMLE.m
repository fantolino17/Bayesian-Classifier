%Frank Antolino
%Dr. Leeds
%File: evaluateMLE.m

function [output] = evaluateMLE(testData,fParams,nParams,tParams)

  numCorrect = 0;
  numTotal = 0;
  test = char(struct2cell(testData));

  for i = 1:length(test)

     x = classifyNeedLikelihood(test(i,2),fParams,nParams,tParams);

     %Compare the predicted action,[x], to the actual action, [test(i,1)]
     %and keep track of total matches.
     if x==test(i,1)
        numCorrect = numCorrect+1;
     end
     numTotal = numTotal+1;

  end

  output = (numCorrect/numTotal);


end

