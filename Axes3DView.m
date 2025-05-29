function Axes3DView(ax)
%控制视角、坐标轴平行等
%目前这些参数对1个图优化较好

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
