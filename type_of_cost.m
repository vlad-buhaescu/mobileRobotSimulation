function varargout = type_of_cost(varargin)
% TYPE_OF_COST MATLAB code for type_of_cost.fig
%      TYPE_OF_COST, by itself, creates a new TYPE_OF_COST or raises the existing
%      singleton*.
%
%      H = TYPE_OF_COST returns the handle to a new TYPE_OF_COST or the handle to
%      the existing singleton*.
%
%      TYPE_OF_COST('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TYPE_OF_COST.M with the given input arguments.
%
%      TYPE_OF_COST('Property','Value',...) creates a new TYPE_OF_COST or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before type_of_cost_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to type_of_cost_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help type_of_cost

% Last Modified by GUIDE v2.5 14-Apr-2013 16:30:10

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @type_of_cost_OpeningFcn, ...
                   'gui_OutputFcn',  @type_of_cost_OutputFcn, ...
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


% --- Executes just before type_of_cost is made visible.
function type_of_cost_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to type_of_cost (see VARARGIN)

% Choose default command line output for type_of_cost
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes type_of_cost wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = type_of_cost_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton1
if (get(handles.radiobutton1,'Value') == get(hObject,'Max'))
	% Radio button is selected-take appropriate action
   
   % set(handles.radio2,'Enable','off');
   cost_type= '1';
   setappdata(0,'cost_type', cost_type);
   close; 

end

% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton2
if (get(handles.radiobutton2,'Value') == get(hObject,'Max'))
	% Radio button is selected-take appropriate action
   
   % set(handles.radio2,'Enable','off');
   cost_type= '2';
   setappdata(0,'cost_type', cost_type);
   close; 

end

% --- Executes on button press in radiobutton3.
function radiobutton3_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton3

if (get(handles.radiobutton3,'Value') == get(hObject,'Max'))
	% Radio button is selected-take appropriate action
   
   % set(handles.radio2,'Enable','off');
   cost_type= '3';
   setappdata(0,'cost_type', cost_type);
   close; 

end

% --- Executes on button press in radiobutton4.
function radiobutton4_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton4
if (get(handles.radiobutton4,'Value') == get(hObject,'Max'))
	% Radio button is selected-take appropriate action
   
   % set(handles.radio2,'Enable','off');
   cost_type= '4';
   setappdata(0,'cost_type', cost_type);
   close; 

end

 
