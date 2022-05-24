clc;
clear all;
close all;

pathMain='C:\\Users\\MZ\\Desktop\\poc4';
path='C:\\Users\\MZ\\Desktop\\poc4';
imgName=["gwiazda" "trojkat" "romb"];

%% calculating coefficients for all previous images
%K, Mz, C, M, Lp
imgCoeffs=zeros(5,5,3); %5 coefficients for 5 images of 3 types
trainData=zeros(15,3);
counter=1;
for i=1:size(imgName,2)
    for j=1:5
        img=imread(sprintf([pathMain '%s\\%s%d.png'],imgName(i),imgName(i),j));
        if size(img,3)==3
            img=rgb2gray(img);
        end
        [imgCoeffs(1,j,i), imgCoeffs(2,j,i), imgCoeffs(3,j,i), imgCoeffs(4,j,i), imgCoeffs(5,j,i)]=calcCoeffs(img);
        trainData(counter,1)=imgCoeffs(1,j,i);
        trainData(counter,2)=imgCoeffs(2,j,i);
        trainData(counter,3)=i;
        counter=counter+1;
    end
end

%%classifying new images on the base of previous groups
for k=1:2:7    
    plotPoints(imgCoeffs);
    hold on;
    counter=1;
    coeffsNClass=zeros(6,3);
    distances=zeros(6,15,2); %6 points to 15 from previous group
    for i=1:size(imgName,2)
        for j=1:2
            img=imread(sprintf([path '%s_new%d.png'],imgName(i),j));
            if size(img,3)==3
                img=rgb2gray(img);
            end
            [coeffsNClass(counter,1:2),coeffsNClass(counter,3),distances(counter,:,:)]=kNNClassifier(img,trainData,k);
            plot(coeffsNClass(counter,1),coeffsNClass(counter,2),'o');
            hold on;
            counter=counter+1;
        end
    end
    legend('circle','square','triangle',sprintf('circle1 C=%d',coeffsNClass(1,3)),sprintf('circle2 C=%d',coeffsNClass(2,3)),sprintf('square1 C=%d',coeffsNClass(3,3)),sprintf('square2 C=%d',coeffsNClass(4,3)),sprintf('triangle1 C=%d',coeffsNClass(5,3)),sprintf('triangle2 C=%d',coeffsNClass(6,3)),'Location','northwest','AutoUpdate','off');
    for l=1:6
        %drawing lines between new point and its neighbours
        for m=1:k
            plot([coeffsNClass(l,1),trainData(distances(l,m,2),1)],[coeffsNClass(l,2),trainData(distances(l,m,2),2)]);
            hold on;
        end
    end
    title(sprintf('k=%d',k));
    xlabel('K');
    ylabel('Mz');
    saveas(gcf,sprintf([path 'K=%d.png'],k));
    close;
end