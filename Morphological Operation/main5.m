function varargout = main5(varargin)
% main5 M-file for main5.fig
%      main5, by itself, creates a new main5 or raises the existing
%      singleton*.
%
%      H = main5 returns the handle to a new main5 or the handle to
%      the existing singleton*.
%
%      main5('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in main5.M with the given input arguments.
%
%      main5('Property','Value',...) creates a new main5 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before main5_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to main5_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help main5

% Last Modified by GUIDE v2.5 28-Aug-2013 17:10:22

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @main5_OpeningFcn, ...
                   'gui_OutputFcn',  @main5_OutputFcn, ...
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


% --- Executes just before main5 is made visible.
function main5_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to main5 (see VARARGIN)

% Choose default command line output for main5
handles.output = hObject;
global J
global F;
global m;
se = strel('disk',1);
m=imopen(J,se);
axes(handles.axes2)
 imshow(m);
% Update handles structure
guidata(hObject, handles);



% UIWAIT makes main5 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = main5_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
% --- Executes on button press in classification.
