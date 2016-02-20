% Import DAT files generated by simulations into a 3D matrix for further
% analysis 

function modelMatrix = importDAT(folderName)
    oldfolder = cd(folderName); % stores old folder and moves to new folder
    folderDir = dir('*.dat');
    folderDirc = struct2cell(folderDir);
    folderDirc(5,:) = []; % deletes fifth row
    folderDirc(4,:) = []; % deletes fourth row
    folderDirc(3,:) = []; % deletes third row
    folderDirc(2,:) = []; % deletes second row
    folderDirc = transpose(folderDirc);
    folderDirc = sort(folderDirc);
    modelLength = length(folderDirc);
    modelMatrix=zeros(20000,41,modelLength);
    for i = 1:modelLength;
        A=importdata(folderDirc{i});
        modelMatrix(:,:,i) = A;   % append to current file
    end
    modelMatrix = permute(modelMatrix, [3 2 1]);
    modelMatrix = modelMatrix(:,2:41,:);
    cd(oldfolder); % changes back to old folder
end