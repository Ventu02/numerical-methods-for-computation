I = trapezi_comp('effe1',0,12,20,1)
Y = simpson_comp('effe1',0,12,20,1)
quad("effe1",a,b)
disp("trapezi");
err_trapezi_comp('effe1',0,12,20)
disp("simpson");
err_simpson_comp('effe1',0,12,20)
err2_trapezi_rich('effe1',0,12,20);
%err2_simpson_comp('effe1',0,12,20);