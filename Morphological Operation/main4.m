function varargout = main4(varargin)
% main4 M-file for main4.fig
%      main4, by itself, creates a new main4 or raises the existing
%      singleton*.
%
%      H = main4 returns the handle to a new main4 or the handle to
%      the existing singleton*.
%
%      main4('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in main4.M with the given input arguments.
%
%      main4('Property','Value',...) creates a new main4 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before main4_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to main4_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help main4

% Last Modified by GUIDE v2.5 28-Aug-2013 17:10:04

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @main4_OpeningFcn, ...
                   'gui_OutputFcn',  @main4_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before main4 is made visible.
function main4_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to main4 (see VARARGIN)

% Choose default command line output for main4
handles.output = hObject;
global img1
global J
global F
 global name
%  [a b c]=size(img1);
%  if c==3
%      img1=rgb2gray(img1);
%  end
global pixel_labels
global name;
global segmented_images
figure,imshow(img1), title('H&E image');
text(size(img1,2),size(img1,1)+15,...
     'Image courtesy of Alan Partin, Johns Hopkins University', ...
     'FontSize',7,'HorizontalAlignment','right');
cform = makecform('srgb2lab');
lab_he = applycform(img1,cform);
ab = double(lab_he(:,:,2:3));
nrows = size(ab,1);
ncols = size(ab,2);
ab = reshape(ab,nrows*ncols,2);
nColors = 3;
% repeat the clustering 3 times to avoid local minima
[cluster_idx cluster_center] = kmeans(ab,nColors,'distance','sqEuclidean', ...
                                      'Replicates',3);
pixel_labels = reshape(cluster_idx,nrows,ncols);
%figure(1),imshow(pixel_labels,[]), title('image labeled by cluster index');
J=pixel_labels;
[m n]=size(J);

% segmented_images = cell(1,3);
% rgb_label = repmat(pixel_labels,[1 1 3]);
% 
% for k = 1:nColors
%     color = img1;    color(rgb_label ~= k) = 0;
%      segmented_images{k} = color;
% end
% 
%  figure(2),imshow(segmented_images{1}), title('objects in cluster 1');
%   
%  figure(3), imshow(segmented_images{2}), title('objects in cluster 2');
%   
%  figure(4), imshow(segmented_images{3}), title('objects in cluster 3');
%  segmented_images=segmented_images';
% 
for i=1:m
for j=1:n
if J(i,j)<2
J(i,j)=0;
end
end
end
 if name==1
     J=J;
end
 imshow(J);
J=~J;

 axes(handles.axes2), imshow(J); title('K-Means Segmentation');
 
imwrite(J,'J.jpg');
% Update handles structure
guidata(hObject, handles);



% UIWAIT makes main4 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = main4_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
% --- Executes on button press in classification.
