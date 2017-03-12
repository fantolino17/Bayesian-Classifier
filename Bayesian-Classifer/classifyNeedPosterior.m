%Frank Antolino
%Dr. Leeds
%File: classifyNeedPosterior.m
%-----------------------------

function [output] = classifyNeedPosterior(action,fParams,nParams,tParams,Prior)

  %{Set fPost,nPost,tPost based on action passed in%}
  switch(action)
    case 'K'
      fPost = fParams(1)*Prior(1);
      nPost = nParams(1)*Prior(2);
      tPost = tParams(1)*Prior(3);
    case 'H'
      fPost = fParams(2)*Prior(1);
      nPost = nParams(2)*Prior(2);
      tPost = tParams(2)*Prior(3);
    case 'T'
      fPost = fParams(3)*Prior(1);
      nPost = nParams(3)*Prior(2);
      tPost = tParams(3)*Prior(3);
    case 'S'
      fPost = (1-(fParams(1)+fParams(2)+fParams(3)))*(Prior(1));
      nPost = (1-(nParams(1)+nParams(2)+nParams(3)))*(Prior(2));
      tPost = (1-(tParams(1)+tParams(2)+tParams(3)))*(Prior(3));
  end

  %{Select the largest probabilty,(Prior was included above)%}
  if fPost>nPost & fPost>tPost
    output = 'F';
    return
  end
  if nPost>fPost & nPost>tPost
    output = 'N';
    return
  end
  if tPost>fPost & tPost>nPost
    output = 'T';
    return
  end

end

