function controlAll(iNumber)
%function controlAll(iNumber)
if nargin==0
    iNumber=get(gcf,'Number');
end
%% ȫ�ֱ���
global isOut;                    %�Ƿ����ͼƬ
global name;        %���ͼƬ����
global iColor;                  %ѡ��ColorOrderɫϵ
global Dimention;                %ѡ��2/3ά�Ȼ�ͼ
global idrawType                %�Ժ��ַ���ͼ1,2,3...
%...........................%������

%% figure��������
handleMyFigure = tuShapeFigure(iNumber,1,'on');

if isempty(handleMyFigure)
    return
end

tuShapeFigure(iNumber,1,'on');

%% axes�������������
%
%   ��ȡ���е�axes�����޳�legend����
handleMyAxes=findobj(handleMyFigure.Children,'Type','Axes');
mMyAxes=size(handleMyAxes,1);
nMyAxes=size(handleMyAxes,2);
%   ��Ҫѡ���Ƿ���ά��ͼ
switch Dimention
    case 3
        dimentionControl=ones(mMyAxes,nMyAxes);
    case 2
        dimentionControl=zeros(mMyAxes,nMyAxes);
    otherwise
        disp('������')
end

for iMyAxes=1:mMyAxes
    for jMyAxes=1:nMyAxes
        %���������������
        handleMyAxes(iMyAxes,jMyAxes)=controlAxes(handleMyAxes(iMyAxes,jMyAxes),iColor);
        %controlAxes(handleMyAxes,iColor);
        %3D�ŵ��ã����ڵ�����ͼ��ת
        %�����������ǩ����ƽ�У������άͼ���������άͼ�����
        if dimentionControl(iMyAxes,jMyAxes)==1
            Axes3DView(handleMyAxes(iMyAxes,jMyAxes));
        end
    end
end

%% �����������(δ���.......)
for iMyAxes=1:mMyAxes
    for jMyAxes=1:nMyAxes
        handleMyDraw=handleMyAxes(iMyAxes,jMyAxes).Children;
        nMyDraw=size(handleMyDraw,1)*size(handleMyDraw,2);
        %���ɻ�ͼѭ�����
        myLineType=repmat({'-';'--';':'; '-.'},nMyDraw,1);%�������ͷ�������
        myMarkerType=repmat({'s';'o';'<';'d';'>'},nMyDraw,1);%���ɱ�Ƿ�������
        myco=repmat(handleMyAxes(iMyAxes,jMyAxes).ColorOrder,[nMyDraw,1]);%�޸�������ɫ
        for iMyDraw=1:nMyDraw
            %��ʼ��Բ�ͬ��������������Ż�,����������������ľ��
            handleMyDraw(iMyDraw)=controlMatchElement(handleMyDraw(iMyDraw),iColor,myLineType{iMyDraw},...
                myMarkerType{iMyDraw},myco(iMyDraw,:),idrawType);
        end%��һ���������е�ÿ���߻�����ÿ����Ȼ�ͼԪ��ѭ��
    end%��figure�е�ÿһ��ѭ��
end%��figure�е�ÿһ�н���ѭ��

%% ���ͼ��
if isOut==1
tuExport(handleMyFigure,name,'-dtiff','off')
% myExportFigure(handleMyFigure,name,'-dtiff');
%function myExportFigure(handleMyFigure,name,format)
end
%clc;
if isOut==1
    disp('�����!�ѱ���ͼƬ��');
else
    disp('�����!δ���棡');
end