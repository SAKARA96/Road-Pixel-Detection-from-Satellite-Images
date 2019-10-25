global gray;
global bw;
global bw1;
global bw2;
bw=(gray>150);

bw1=bwmorph(bw,'clean',5);
bw2=bwmorph(bw1,'majority',10);


axes(handles.axes3);
imshow(bw2);