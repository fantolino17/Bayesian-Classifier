%Frank Antolino
%Dr. Leeds
%Machine Learning
%--------------Question 1---------------------
%This function identifies every instance of
%the passed class as well as which activity was
%associated with it. It then calculates the
%number of occurences of an activity divided by
%total number of instances of the passed class.
%----------------------------------------------

function [output] = learnParams(train,class)

 classCount = 0;
 kickCount = 0;
 hitCount = 0;
 throwCount = 0;
 screamCount = 0;

 x = char(struct2cell(train));

 for i=1:length(x)

          if x(i,1)==class
            classCount = classCount+1;

            switch x(i,2)
             case 'K'
              kickCount = kickCount + 1;
             case 'H'
              hitCount = hitCount + 1;
             case 'T'
              throwCount = throwCount + 1;
             case 'S'
              screamCount = screamCount + 1;
            end
          end
 end
          pKick = kickCount/classCount;
          pHit = hitCount/classCount;
          pThrow = throwCount/classCount;
          pScream = screamCount/classCount;

 output = [pKick,pHit,pThrow,pScream];
end
%{
Alternatively, could have done 1-(pKick+pHit+pThrow)
to get pScream, assuming kick,hit, throw and scream 
make up all possible actions
%}