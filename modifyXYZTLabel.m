function handleMyAxes=modifyXYZTLabel(handleMyAxes,XYZT)
%   ���Ҫ�޸ĵ��������򣬿��Ի��handleMyAxes=gco
%   XYZTΪ����Ԫ�����飬�ֱ�����������ǩ�ͱ����"����"
set(handleMyAxes.XLabel,'Interpreter','latex');
set(handleMyAxes.YLabel,'Interpreter','latex');
set(handleMyAxes.ZLabel,'Interpreter','latex');
set(handleMyAxes.Title,'Interpreter','latex');

handleMyAxes.XLabel.String=XYZT{1};
handleMyAxes.YLabel.String=XYZT{2};
handleMyAxes.ZLabel.String=XYZT{3};
handleMyAxes.Title.String=XYZT{4};

end