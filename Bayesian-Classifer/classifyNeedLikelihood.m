%{
Frank Antolino
Dr. Leeds
File: classifyNeedLikelihood.m
%}


function [output] = classifyNeedLikelihood(action, fParams, nParams, tParams)

  %{Set fP,nP,tP based on the action passed in.%}
  switch(action)
   case 'K'
     fP = fParams(1);
     nP = nParams(1);
     tP = tParams(1);
   case 'H'
     fP = fParams(2);
     nP = nParams(2);
     tP = tParams(2);
   case 'T'
     fP = fParams(3);
     nP = nParams(3);
     tP = tParams(3);
   case 'S'
     fP = 1-(fParams(1)+fParams(2)+fParams(3));
     nP = 1-(nParams(1)+nParams(2)+nParams(3));
     tP = 1-(tParams(1)+tParams(2)+tParams(3));
   otherwise %incorrect data was passed
     output = -1;
     return
  end

  %{Select the largest probabilty.%}
  if fP>nP & fP>tP
    output = 'F';
    return
  end
  if nP>fP & nP>tP
    output = 'N';
    return
  end
  if tP>fP & tP>nP
    output = 'T';
    return
  else
    output = -1;
  end

end

