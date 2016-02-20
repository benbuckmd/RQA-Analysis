% Calculates differences between vectors of arbitrary size.
% Accepts cell array containing barycenters (1st column) and vectors (2nd
% column).
% Returns four-column cell array containing Vector 1, Vector 2, the dot
% product of these two vectors, and the angle calculated from these dot
% products.

function vectorArray = compareVectors(vectorList)
    % Initialize vectors and matricies
    k = 0;
    inDim = size(vectorList);
    inDimL = inDim(1);
    outDimL = (inDimL*(inDimL-1))/2;
    vectorArray = cell(outDimL, 4);
    
    % Populate array
    for i = 1 : inDimL - 1
        for j = i + 1 : inDimL
            k = k + 1;
            v1 = vectorList{i, 2};
            v2 = vectorList{j, 2};
            dotv1v2 = dot(v1, v2)/(norm(v1)*norm(v2)); 
            angv1v2 = acos(dotv1v2);
            vectorArray{k, 1} = i;
            vectorArray{k, 2} = j;
            vectorArray{k, 3} = dotv1v2;
            vectorArray{k, 4} = angv1v2;
        end
    end
end
