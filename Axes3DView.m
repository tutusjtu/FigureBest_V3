function Axes3DView(ax)
%�����ӽǡ�������ƽ�е�
%Ŀǰ��Щ������1��ͼ�Ż��Ϻ�

set(ax,'View',[45 15]);
ax.XLabel.Rotation=-16;
ax.YLabel.Rotation=16;
ax.ZLabel.Rotation=90;
ax.XLabel.HorizontalAlignment='right';
ax.YLabel.HorizontalAlignment='left';
ax.ZLabel.HorizontalAlignment='center';
ax.ZGrid='off';
ax.YLabel.VerticalAlignment='bottom';

end
