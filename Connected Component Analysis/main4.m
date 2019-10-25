global bw2;
global s;
global L;
global cc;
global bw3;

cc=bwconncomp(bw2);
s=regionprops(cc,'Area');
L=labelmatrix(cc);
bw3=ismember(L,find([s.Area] >= 500));

axes(handles.axes4);
imshow(bw3);
