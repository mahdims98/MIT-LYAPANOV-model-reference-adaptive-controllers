ab = 97;
R2 = (ab+20) * 0.01;

tau1 = 63.85;
tau2 = 1048.2575;

a1_number =  (tau1 + tau2 + R2) / (tau1*tau2);
a2_number = 1/ (tau1*tau2);

num_real = [R2/(tau1*tau2)];
den_real = [1, a1_number, a2_number];
sys = tf(num_real, den_real);

%% MIT
theta = sym('theta', [3 1]);
syms b a1 a2 p t
y_closedloop(t) = (b * theta(1)) / (p^2 + (b*theta(3) + a1) * p  + (b*theta(2)+a2));

diff_theta1 = diff(y_closedloop, theta(1));
diff_theta2 = diff(y_closedloop, theta(2));
diff_theta3 = diff(y_closedloop, theta(3));



%%

overshoot = 10;
set_time = 100;
period = set_time * 15*2; 

zeta = cos(atan2(pi,-log(overshoot/100)));
% zeta = 0.4;
wn = 4/(set_time); 

sys_des = tf([wn^2],[1, 2*zeta*wn, wn^2]);

[num_des, den_des] = tfdata(sys_des, 'v');
