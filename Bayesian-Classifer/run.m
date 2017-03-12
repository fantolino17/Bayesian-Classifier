%{
To run classifier on HW1Data_NEW.mat
%}
  fParams = learnParams(load('HW1Data_NEW.mat', 'trainMat'),'F');
  nParams = learnParams(load('HW1Data_NEW.mat', 'trainMat'),'N');
  tParams = learnParams(load('HW1Data_NEW.mat', 'trainMat'),'T');

  fParams
  nParams
  tParams

need = classifyNeedLikelihood('H',fParams,nParams,tParams);
need

Prior = [.35 .4 .25];
post=classifyNeedPosterior('H',fParams,nParams,tParams,Prior);
post

fractCorrectMLE = evaluateMLE( x, fParams, nParams, tParams)

fractCorrectMAP = evaluateMAP( x, fParams, nParams, tParams, Prior)


