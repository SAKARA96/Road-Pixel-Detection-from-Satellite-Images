function varargout = main1(varargin)
% main1 M-file for main1.fig
%      main1, by itself, creates a new main1 or raises the existing
%      singleton*.
%
%      H = main1 returns the handle to a new main1 or the handle to
%      the existing singleton*.
%
%      main1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in main1.M with the given input arguments.
%
%      main1('Property','Value',...) creates a new main1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before main1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to main1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help main1

% Last Modified by GUIDE v2.5 06-Sep-2013 11:12:54

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @main1_OpeningFcn, ...
                   'gui_OutputFcn',  @main1_OutputFcn, ...
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


% --- Executes just before main1 is made visible.
function main1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to main1 (see VARARGIN)

% Choose default command line output for main1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);



% UIWAIT makes main1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = main1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
% --- Executes on button press in classification.


function loadimage_Callback(hObject, eventdata, handles)
% hObject    handle to loadimage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img1
global filename
global name
global image;
[filename pathname]=uigetfile({'*.jpg'},'Select the images'); 
 [pathstr, name, ext ] = fileparts(filename);
 name=str2num(name);
img1=imread([pathname filename]);
img1=imresize(img1,[256,256]);
image=img1;
axes(handles.axes1);
title('original image');
imshow(img1);
axis off


function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
main2


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
main8




% --- Executes on button press in pushbutton13.
function pushbutton13_Callback(hObject, eventdata, handles)
main3

% hObject    handle to pushbutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton14.
function pushbutton14_Callback(hObject, eventdata, handles)
main4
 

function pushbutton15_Callback(hObject, eventdata, handles)
main5
% hObject    handle to pushbutton15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton16.
function pushbutton16_Callback(hObject, eventdata, handles)
main6


% hObject    handle to pushbutton16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton17.
function pushbutton17_Callback(hObject, eventdata, handles)
main7
% hObject    handle to pushbutton17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with  handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton18.
function pushbutton18_Callback(hObject, eventdata, handles)
load x
figure,bar(x);
xlabel('     Existing system                                Proposed system');
load x
load a
global name;
global white;
global BW1;
J=imread('J.jpg');
BW1=double(J);
[ymax xmax]=size(J);
 White_pix=0;
 Black_pix=0;
 Floc=0;
 for j=1:(xmax)-1
    for i=1:(ymax)-1
        if BW1(i,j)==0
            White_pix=White_pix+1;
            white=White_pix;
        else
            Black_pix=Black_pix+1;
            black = Black_pix;
            
        end
    end
 end
save whitepix white;
v=a(1,2);
Groundtruth=v
Proposed=white

% hObject    handle to pushbutton18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
