function handleMyDraw=controlMatchElement(handleMyDraw,iColor,myLineType,myMarkerType,myco,idrawType)
if nargin==5
    idrawType=1;
end

switch  handleMyDraw.Type
    
    case 'line'             %������ͼ line:plot������
        if idrawType==1
            controlLineLightColor(handleMyDraw,myLineType,myMarkerType,myco,iColor);
        elseif idrawType==2
            controlLine(handleMyDraw,myLineType,myMarkerType,myco,iColor);
        else
            disp('��controlMatch���޴˷���')
            return
        end
    case 'surface'          %��ά��ͼ
        if idrawType==1
            controlSurfaceLightColor(handleMyDraw,iColor);%������������ɫ������ͼ
        elseif idrawType==2
            controlSurfaceBoldNoColor(handleMyDraw,iColor);%���ƴ���������ɫͼ
        else
            disp('��controlMatch���޴˷���')
            return
        end
    case {'bar','histogram','text'}           %��ά����ͼ
        if idrawType==1
            controlBarLightColor(handleMyDraw,iColor);%������������ɫ������ͼ
        elseif idrawType==2
            controlBarBoldNoColor(handleMyDraw,iColor);
        else
            disp('��controlMatch���޴˷���');
            return
        end
    otherwise
        return
        disp('δ��Ե�ǰͼ�������ر��Ż�')
end
end